import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';

import 'package:makanapa/features/onboarding/domain/models/signup_request.dart';

abstract class LoginRemoteDataSource {
  Future<AuthDataResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<AuthDataResponse> signInWithGoogle(String idToken, String accessToken);
  Future<AuthDataResponse> signUpWithEmailAndPassword(SignupRequest request);
}

abstract class LoginLocalDataSource {
  Future<void> setUserLoginType(String type);
  Future<String?> getUserId();
  Future<void> setUserId(String userId);
}
