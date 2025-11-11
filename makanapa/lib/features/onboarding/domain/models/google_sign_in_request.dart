class GoogleSignInRequest {
  final String accessToken;
  final String idToken;
  final String userName;
  final String email;
  final String? phone;
  final String? avatar;

  const GoogleSignInRequest({
    required this.accessToken,
    required this.idToken,
    required this.userName,
    required this.email,
    this.phone,
    this.avatar,
  });
}
