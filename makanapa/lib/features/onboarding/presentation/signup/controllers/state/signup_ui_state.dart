class SignupUiState {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final String errorEmail;
  final String errorName;
  final String errorPhone;
  final String errorPassword;
  final String errorConfirmPassword;
  final bool isSignUpLoading;

  SignupUiState({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.phoneNumber = '',
    this.name = '',
    this.errorEmail = '',
    this.errorPassword = '',
    this.errorName = '',
    this.errorPhone = '',
    this.errorConfirmPassword = '',
    this.isSignUpLoading = false,
  });

  bool get isSignUpAllowed {
    // Your logic: "enable if both of error is empty or null"
    bool hasNoErrors =
        errorEmail.isEmpty &&
        errorPassword.isEmpty &&
        errorName.isEmpty &&
        errorPhone.isEmpty &&
        errorConfirmPassword.isEmpty;
    bool hasData =
        email.trim().isNotEmpty &&
        password.trim().isNotEmpty &&
        name.trim().isNotEmpty &&
        phoneNumber.trim().isNotEmpty &&
        confirmPassword.trim().isNotEmpty;
    // The button is valid ONLY if there are no errors AND there is data.
    return hasNoErrors && hasData;
  }

  SignupUiState copyWith({
    bool? isLoginAllowed,
    String? email,
    String? password,
    String? name,
    String? confirmPassword,
    String? phoneNumber,
    String? errorEmail,
    String? errorPassword,
    String? errorName,
    String? errorConfirmPassword,
    String? errorPhone,
    bool? isSignUpLoading,
  }) {
    return SignupUiState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      errorName: errorName ?? this.errorName,
      errorPhone: errorPhone ?? this.errorPhone,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
      errorConfirmPassword: errorConfirmPassword ?? this.errorConfirmPassword,
      isSignUpLoading: isSignUpLoading ?? this.isSignUpLoading,
    );
  }
}
