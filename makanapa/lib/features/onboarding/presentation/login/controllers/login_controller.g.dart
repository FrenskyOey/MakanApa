// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginController)
const loginControllerProvider = LoginControllerProvider._();

final class LoginControllerProvider
    extends $NotifierProvider<LoginController, LoginUIState> {
  const LoginControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginControllerHash();

  @$internal
  @override
  LoginController create() => LoginController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUIState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUIState>(value),
    );
  }
}

String _$loginControllerHash() => r'054c3631c77bcfd805c39a120d3c7168089f6d07';

abstract class _$LoginController extends $Notifier<LoginUIState> {
  LoginUIState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LoginUIState, LoginUIState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginUIState, LoginUIState>,
              LoginUIState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
