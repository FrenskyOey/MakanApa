import 'package:dartz/dartz.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';
import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';
import 'package:makanapa/features/onboarding/domain/models/signup_request.dart';
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

  Future<void> _saveUserId(AuthDataResponse authResponse) async {
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
      await Future.wait([
        _saveUserId(authResponse),
        localDataSource.setUserLoginType("email"),
      ]);

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
  Future<Either<String, AuthData>> signUpWithEmailAndPassword(
    SignupRequest request,
  ) async {
    try {
      final authResponse = await remoteDataSource.signUpWithEmailAndPassword(
        request,
      );

      await Future.wait([
        _saveUserId(authResponse),
        localDataSource.setUserLoginType("email"),
      ]);

      final newUserResponse = await userRemoteDataSource.createUser(
        authResponse,
        userName: request.userName,
        phoneNumber: request.phone,
      );
      await userLocalDataSource.saveUser(newUserResponse.toDomain());
      return Right(authResponse.toDomain());
    } catch (e, stackTrace) {
      // handling error using handleErrorMethod
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
      await Future.wait([
        _saveUserId(authResponse),
        localDataSource.setUserLoginType("google"),
      ]);
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
}
