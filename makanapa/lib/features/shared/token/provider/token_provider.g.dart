// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TokenNotifier)
const tokenProvider = TokenNotifierProvider._();

final class TokenNotifierProvider
    extends $NotifierProvider<TokenNotifier, TokenState> {
  const TokenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenNotifierHash();

  @$internal
  @override
  TokenNotifier create() => TokenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenState>(value),
    );
  }
}

String _$tokenNotifierHash() => r'b1d7eb322fa99bf463587c88a51d7d79921f4856';

abstract class _$TokenNotifier extends $Notifier<TokenState> {
  TokenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TokenState, TokenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TokenState, TokenState>,
              TokenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
