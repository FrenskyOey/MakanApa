class ChangePasswordUIState {
  final bool showProcessLoading;
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  final String errorPassword;
  final String errorNewPassword;
  final String errorConfirmPassword;

  ChangePasswordUIState({
    this.oldPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
    this.errorPassword = '',
    this.errorNewPassword = '',
    this.errorConfirmPassword = '',
    this.showProcessLoading = false,
  });

  bool get isSubmitAllowed {
    // Your logic: "enable if both of error is empty or null"
    bool hasNoErrors =
        errorPassword.isEmpty &&
        errorNewPassword.isEmpty &&
        errorConfirmPassword.isEmpty;
    bool hasData =
        oldPassword.trim().isNotEmpty &&
        newPassword.trim().isNotEmpty &&
        confirmPassword.isNotEmpty;
    // The button is valid ONLY if there are no errors AND there is data.
    return hasNoErrors && hasData;
  }

  ChangePasswordUIState copyWith({
    String? oldPassword,
    String? newPassword,
    String? confirmPassword,
    String? errorPassword,
    String? errorNewPassword,
    String? errorConfirmPassword,
    bool? showProcessLoading,
  }) {
    return ChangePasswordUIState(
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorPassword: errorPassword ?? this.errorPassword,
      errorNewPassword: errorNewPassword ?? this.errorNewPassword,
      errorConfirmPassword: errorConfirmPassword ?? this.errorConfirmPassword,
      showProcessLoading: showProcessLoading ?? this.showProcessLoading,
    );
  }
}
