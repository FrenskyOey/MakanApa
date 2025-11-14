import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';

import 'package:makanapa/features/onboarding/domain/models/signup_request.dart';

abstract class LoginRemoteDataSource {
  Future<AuthDataResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<AuthDataResponse> signInWithGoogle(String idToken, String accessToken);
  Future<AuthDataResponse> signUpWithEmailAndPassword(SignupRequest request);
  Future<void> signOut();
  Future<String> refreshToken(String refreshToken);
}

abstract class LoginLocalDataSource {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<String?> getUserId();
  Future<void> setUserId(String userId);
  Future<void> clearTokens();
}
