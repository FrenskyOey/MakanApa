class SignupRequest {
  final String userName;
  final String email;
  final String? phone;
  final String? password;

  const SignupRequest({
    required this.userName,
    required this.password,
    required this.email,
    required this.phone,
  });
}
