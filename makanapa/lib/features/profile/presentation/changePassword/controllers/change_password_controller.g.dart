// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChangePasswordController)
const changePasswordControllerProvider = ChangePasswordControllerProvider._();

final class ChangePasswordControllerProvider
    extends $NotifierProvider<ChangePasswordController, ChangePasswordUIState> {
  const ChangePasswordControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changePasswordControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changePasswordControllerHash();

  @$internal
  @override
  ChangePasswordController create() => ChangePasswordController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChangePasswordUIState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChangePasswordUIState>(value),
    );
  }
}

String _$changePasswordControllerHash() =>
    r'c9910d1610ec24df2f3a59b00fbd3b3afe0e565d';

abstract class _$ChangePasswordController
    extends $Notifier<ChangePasswordUIState> {
  ChangePasswordUIState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ChangePasswordUIState, ChangePasswordUIState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChangePasswordUIState, ChangePasswordUIState>,
              ChangePasswordUIState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
