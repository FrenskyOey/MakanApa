class ProfileEditUIState {
  final String name;
  final String phoneNumber;
  final String errorName;
  final String errorPhone;
  final String? avatarFiles;

  final bool showProgress;

  ProfileEditUIState({
    this.phoneNumber = '',
    this.name = '',
    this.errorName = '',
    this.errorPhone = '',
    this.avatarFiles,
    this.showProgress = false,
  });

  bool get isSubmitAllowed {
    // Your logic: "enable if both of error is empty or null"
    bool hasNoErrors = errorName.isEmpty && errorPhone.isEmpty;
    bool hasData = name.trim().isNotEmpty && phoneNumber.trim().isNotEmpty;
    // The button is valid ONLY if there are no errors AND there is data.
    return hasNoErrors && hasData;
  }

  ProfileEditUIState copyWith({
    String? phoneNumber,
    String? name,
    String? errorName,
    String? errorPhone,
    String? avatarFiles,
    bool? showProgress,
  }) {
    return ProfileEditUIState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      errorName: errorName ?? this.errorName,
      errorPhone: errorPhone ?? this.errorPhone,
      avatarFiles: avatarFiles ?? this.avatarFiles,
      showProgress: showProgress ?? this.showProgress,
    );
  }
}
