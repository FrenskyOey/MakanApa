// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileController)
const profileControllerProvider = ProfileControllerProvider._();

final class ProfileControllerProvider
    extends $NotifierProvider<ProfileController, ProfileUIState> {
  const ProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileControllerHash();

  @$internal
  @override
  ProfileController create() => ProfileController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileUIState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileUIState>(value),
    );
  }
}

String _$profileControllerHash() => r'3194dd7613e3d02c64005067eefb1b0ddb2dea47';

abstract class _$ProfileController extends $Notifier<ProfileUIState> {
  ProfileUIState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProfileUIState, ProfileUIState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileUIState, ProfileUIState>,
              ProfileUIState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
