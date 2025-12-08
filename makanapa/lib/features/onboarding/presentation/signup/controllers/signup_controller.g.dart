// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignUpController)
const signUpControllerProvider = SignUpControllerProvider._();

final class SignUpControllerProvider
    extends $NotifierProvider<SignUpController, SignupUiState> {
  const SignUpControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpControllerHash();

  @$internal
  @override
  SignUpController create() => SignUpController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignupUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignupUiState>(value),
    );
  }
}

String _$signUpControllerHash() => r'69017c69a7eb9e6e9fd53a4d8d68f01e6657ec14';

abstract class _$SignUpController extends $Notifier<SignupUiState> {
  SignupUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignupUiState, SignupUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignupUiState, SignupUiState>,
              SignupUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
