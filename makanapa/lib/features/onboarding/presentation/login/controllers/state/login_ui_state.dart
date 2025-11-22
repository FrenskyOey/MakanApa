class LoginUIState {
  final String email;
  final String password;
  final String errorEmail;
  final String errorPassword;
  final bool isLoginLoading;

  LoginUIState({
    this.email = '',
    this.password = '',
    this.errorEmail = '',
    this.errorPassword = '',
    this.isLoginLoading = false,
  });

  bool get isLoginAllowed {
    // Your logic: "enable if both of error is empty or null"
    bool hasNoErrors = errorEmail.isEmpty && errorPassword.isEmpty;
    bool hasData = email.trim().isNotEmpty && password.trim().isNotEmpty;
    // The button is valid ONLY if there are no errors AND there is data.
    return hasNoErrors && hasData;
  }

  LoginUIState copyWith({
    bool? isLoginAllowed,
    String? email,
    String? password,
    String? errorEmail,
    String? errorPassword,
    bool? isLoginLoading,
  }) {
    return LoginUIState(
      email: email ?? this.email,
      password: password ?? this.password,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword,
      isLoginLoading: isLoginLoading ?? this.isLoginLoading,
    );
  }
}
