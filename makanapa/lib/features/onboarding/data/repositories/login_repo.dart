import 'package:dartz/dartz.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';
import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';
import 'package:makanapa/features/onboarding/domain/repositories/login_repository.dart';

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

  @override
  Future<Either<String, AuthData>> signInWithGoogle(
    GoogleSignInRequest request,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, AuthData>> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> performTokenRefresh() {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String?>> getRefreshToken() {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String?>> getAccessToken() {
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> logout() {
    throw UnimplementedError();
  }
}
