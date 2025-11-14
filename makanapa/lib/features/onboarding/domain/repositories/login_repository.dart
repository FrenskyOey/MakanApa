import 'package:dartz/dartz.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';
import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';
import 'package:makanapa/features/onboarding/domain/models/signup_request.dart';

abstract class LoginRepository {
  Future<Either<String, AuthData>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<String, AuthData>> signInWithGoogle(
    GoogleSignInRequest request,
  );
  Future<Either<String, AuthData>> signUpWithEmailAndPassword(
    SignupRequest request,
  );
  Future<Either<String, void>> logout();
  Future<String?> getRefreshToken();
  Future<String?> getAccessToken();
  Future<Either<String, String>> performTokenRefresh();
}
