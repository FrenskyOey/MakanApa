// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainController)
const mainControllerProvider = MainControllerProvider._();

final class MainControllerProvider
    extends $NotifierProvider<MainController, MainUiState> {
  const MainControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainControllerHash();

  @$internal
  @override
  MainController create() => MainController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MainUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MainUiState>(value),
    );
  }
}

String _$mainControllerHash() => r'e71ca2c73b9e1d3cd77a8309a805b9f33d5b688e';

abstract class _$MainController extends $Notifier<MainUiState> {
  MainUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MainUiState, MainUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MainUiState, MainUiState>,
              MainUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
