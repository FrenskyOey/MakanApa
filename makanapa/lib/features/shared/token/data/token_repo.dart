import 'package:dartz/dartz.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/shared/token/data/data_source/token_data_source.dart';
import 'package:makanapa/features/shared/token/domain/token_repository.dart';

class TokenRepositoryImp implements TokenRepository {
  final TokenRemoteDataSource remoteDataSource;
  final TokenLocalDataSource localDataSource;
  final UserLocalDataSource userLocalDataSource;

  TokenRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<String, String>> performTokenRefresh() async {
    try {
      final newAuthResponse = await remoteDataSource.refreshToken();
      return Right(newAuthResponse.$1);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  String? getRefreshToken() {
    final refreshToken = localDataSource.getRefreshToken();
    return refreshToken;
  }

  @override
  String? getAccessToken() {
    final accessToken = localDataSource.getAccessToken();
    return accessToken;
  }

  @override
  Future<Either<String, void>> logout() async {
    try {
      await remoteDataSource.signOut();
    } catch (_) {
      // nothing to do if sign out fails
    }
    await localDataSource.clearTokens();
    await userLocalDataSource.clearUser();
    return Right(null);
  }

  @override
  Stream<String?> onTokenChanged() {
    return localDataSource.onTokenChanged();
  }
}
