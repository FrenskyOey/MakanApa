import 'package:dio/dio.dart';
import 'package:makanapa/features/shared/models/device_config.dart';
import 'package:makanapa/features/shared/provider/token/token_provider.dart';
import 'package:makanapa/features/shared/provider/token/token_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// A Dio Interceptor that adds Auth token and Device/App info to request headers.
class AuthInterceptor extends Interceptor {
  final DeviceConfig deviceConfig;
  final Ref ref;
  final Dio dio;
  bool _isRefreshing = false;

  // A list to hold requests that failed while the token was being refreshed.
  final List<(RequestOptions, ErrorInterceptorHandler)> _failedRequests = [];

  AuthInterceptor({
    required this.deviceConfig,
    required this.ref,
    required this.dio,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final tokenState = ref.read(tokenProvider);
    final token = tokenState.whenOrNull(loginState: (token) => token);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // 2. Add Device and App Information Headers
    // Note: It's common to prefix custom headers with 'X-' or 'App-'
    options.headers['X-Device-OS'] = deviceConfig.deviceOs;
    options.headers['X-Device-OS-Version'] = deviceConfig.osVersion;
    options.headers['X-Device-Model'] = deviceConfig.deviceModel;
    options.headers['X-App-Version'] = deviceConfig.appVersion;

    // Optional: Add a consolidated User-Agent header
    options.headers['User-Agent'] = deviceConfig.userAgent;
    // Continue the request chain
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // will handling refresh token
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    // Add the failed request to our queue
    _failedRequests.add((err.requestOptions, handler));

    // If a refresh is not already in progress, start one.
    if (!_isRefreshing) {
      _isRefreshing = true;

      try {
        final newToken = await ref.read(tokenProvider.notifier).refreshToken();

        if (newToken != null) {
          await _retryQueuedRequests(newToken);
        } else {
          // logout event should be hapening and should route to intro page
          _rejectQueuedRequests(err);
        }
      } catch (e) {
        _rejectQueuedRequests(
          DioException(requestOptions: err.requestOptions, error: e),
        );
      } finally {
        // Reset the state
        _isRefreshing = false;
        _failedRequests.clear();
      }
    }
    super.onError(err, handler);
  }

  /// Retries all the requests that were queued while the token was being refreshed.
  Future<void> _retryQueuedRequests(String newToken) async {
    for (final request in _failedRequests) {
      final options = request.$1;
      final handler = request.$2;

      // Update the header with the new token
      options.headers['Authorization'] = 'Bearer $newToken';

      try {
        // Retry the request
        final response = await dio.fetch(options);
        handler.resolve(response);
      } catch (e) {
        // If retrying fails, reject the request
        handler.reject(
          e is DioException
              ? e
              : DioException(requestOptions: options, error: e),
        );
      }
    }
  }

  /// Rejects all the requests that were queued.
  void _rejectQueuedRequests(DioException error) {
    for (final request in _failedRequests) {
      final handler = request.$2;
      handler.reject(error);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // manipulate response here if needed
    super.onResponse(response, handler);
  }
}
