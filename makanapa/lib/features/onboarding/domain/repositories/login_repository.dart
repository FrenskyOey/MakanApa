import 'package:dartz/dartz.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';
import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';

abstract class LoginRepository {
  Future<Either<String, AuthData>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<String, AuthData>> signInWithGoogle(
    GoogleSignInRequest request,
  );
  Future<Either<String, void>> logout();
  Future<Either<String, String?>> getAccessToken();
  Future<Either<String, String?>> getRefreshToken();
  Future<Either<String, String>> performTokenRefresh();
}
