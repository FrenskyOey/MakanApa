// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileEditController)
const profileEditControllerProvider = ProfileEditControllerProvider._();

final class ProfileEditControllerProvider
    extends $NotifierProvider<ProfileEditController, ProfileEditUIState> {
  const ProfileEditControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileEditControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileEditControllerHash();

  @$internal
  @override
  ProfileEditController create() => ProfileEditController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileEditUIState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileEditUIState>(value),
    );
  }
}

String _$profileEditControllerHash() =>
    r'7d5aeec3f90c00114613919a0ac4fcaaafeab78b';

abstract class _$ProfileEditController extends $Notifier<ProfileEditUIState> {
  ProfileEditUIState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProfileEditUIState, ProfileEditUIState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileEditUIState, ProfileEditUIState>,
              ProfileEditUIState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
