import 'package:dartz/dartz.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';
import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';
import 'package:makanapa/features/onboarding/domain/repositories/login_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  LoginRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });

  Future<void> _saveTokens(AuthDataResponse authResponse) async {
    await localDataSource.saveTokens(
      accessToken: authResponse.token,
      refreshToken: authResponse.refreshToken,
    );
    await localDataSource.setUserId(authResponse.userId);
  }

  Future<void> _fetchAndSaveUserProfile(
    AuthDataResponse authResponse, {
    String? userName = "null",
    String? phoneNumber,
    String? avatar,
  }) async {
    try {
      final userResponse = await userRemoteDataSource.getUser(
        authResponse.userId,
      );
      final userData = userResponse.toDomain();
      await userLocalDataSource.saveUser(userData);
    } on PostgrestException catch (_) {
      // Detect PostgrestException without adding imports by inspecting runtime type name.
      final newUserData = await userRemoteDataSource.createUser(
        authResponse,
        userName: userName,
        phoneNumber: phoneNumber,
        avatar: avatar,
      );
      final createdUserData = newUserData.toDomain();
      await userLocalDataSource.saveUser(createdUserData);
    }
  }

  @override
  Future<Either<String, AuthData>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final authResponse = await remoteDataSource.signInWithEmailAndPassword(
        email,
        password,
      );
      // Persist tokens and user id locally
      await _saveTokens(authResponse);
      // Fetch user profile from remote. If not found
      // create the user remotely then continue.
      await _fetchAndSaveUserProfile(authResponse);
      return Right(authResponse.toDomain());
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, AuthData>> signInWithGoogle(
    GoogleSignInRequest request,
  ) async {
    try {
      final authResponse = await remoteDataSource.signInWithGoogle(
        request.idToken,
        request.accessToken,
      );
      // Persist tokens and user id locally
      await _saveTokens(authResponse);
      // Fetch user profile from remote. If not found
      // create the user remotely then continue.
      await _fetchAndSaveUserProfile(
        authResponse,
        userName: request.userName,
        phoneNumber: request.phone,
        avatar: request.avatar,
      );
      return Right(authResponse.toDomain());
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, String>> performTokenRefresh() async {
    final refreshToken = await localDataSource.getRefreshToken();
    if (refreshToken == null) {
      return Left("No refresh token found");
    }
    try {
      final newAuthResponse = await remoteDataSource.refreshToken(refreshToken);
      await localDataSource.saveTokens(
        accessToken: newAuthResponse,
        refreshToken: refreshToken,
      );
      return Right(newAuthResponse);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    final refreshToken = await localDataSource.getRefreshToken();
    return refreshToken;
  }

  @override
  Future<String?> getAccessToken() async {
    final accessToken = await localDataSource.getAccessToken();
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
}
