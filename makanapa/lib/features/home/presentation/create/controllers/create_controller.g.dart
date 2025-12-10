// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateController)
const createControllerProvider = CreateControllerProvider._();

final class CreateControllerProvider
    extends $NotifierProvider<CreateController, CreateUiState> {
  const CreateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createControllerHash();

  @$internal
  @override
  CreateController create() => CreateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateUiState>(value),
    );
  }
}

String _$createControllerHash() => r'39b195d458f39cd9373f2b7281b9a5131df92fff';

abstract class _$CreateController extends $Notifier<CreateUiState> {
  CreateUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CreateUiState, CreateUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateUiState, CreateUiState>,
              CreateUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
