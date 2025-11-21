// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FaqController)
const faqControllerProvider = FaqControllerProvider._();

final class FaqControllerProvider
    extends $NotifierProvider<FaqController, FaqUiState> {
  const FaqControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faqControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faqControllerHash();

  @$internal
  @override
  FaqController create() => FaqController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaqUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaqUiState>(value),
    );
  }
}

String _$faqControllerHash() => r'84b09cdd5c2f23c0c3b974713eceeeb4f7f8e285';

abstract class _$FaqController extends $Notifier<FaqUiState> {
  FaqUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FaqUiState, FaqUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FaqUiState, FaqUiState>,
              FaqUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
