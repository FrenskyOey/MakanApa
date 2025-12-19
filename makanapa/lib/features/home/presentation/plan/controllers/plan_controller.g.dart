// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlanController)
const planControllerProvider = PlanControllerProvider._();

final class PlanControllerProvider
    extends $NotifierProvider<PlanController, PlanUiState> {
  const PlanControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'planControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$planControllerHash();

  @$internal
  @override
  PlanController create() => PlanController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlanUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlanUiState>(value),
    );
  }
}

String _$planControllerHash() => r'1ac3a4d636a6aa8ea843a7fd8d198ae22b8d825e';

abstract class _$PlanController extends $Notifier<PlanUiState> {
  PlanUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PlanUiState, PlanUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlanUiState, PlanUiState>,
              PlanUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
