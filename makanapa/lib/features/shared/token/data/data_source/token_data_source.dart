abstract class TokenRemoteDataSource {
  Future<void> signOut();
  Future<(String newToken, String newRefreshToken)> refreshToken();
}

abstract class TokenLocalDataSource {
  String? getAccessToken();
  String? getRefreshToken();
  Future<void> clearTokens();
  Stream<String?> onTokenChanged();
}
