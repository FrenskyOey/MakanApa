// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pager_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PagerController)
const pagerControllerProvider = PagerControllerProvider._();

final class PagerControllerProvider
    extends $NotifierProvider<PagerController, double> {
  const PagerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pagerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pagerControllerHash();

  @$internal
  @override
  PagerController create() => PagerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$pagerControllerHash() => r'acdb5eaaf6182e1fc1f5236eb5ad3c4b38793a8f';

abstract class _$PagerController extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
