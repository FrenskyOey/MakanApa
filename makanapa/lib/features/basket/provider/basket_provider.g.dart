// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(basketRemoteDataSource)
const basketRemoteDataSourceProvider = BasketRemoteDataSourceProvider._();

final class BasketRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          BasketRemoteDataSource,
          BasketRemoteDataSource,
          BasketRemoteDataSource
        >
    with $Provider<BasketRemoteDataSource> {
  const BasketRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'basketRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$basketRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<BasketRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BasketRemoteDataSource create(Ref ref) {
    return basketRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BasketRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BasketRemoteDataSource>(value),
    );
  }
}

String _$basketRemoteDataSourceHash() =>
    r'80236ae39471ebb5d4193420a74b3466f2b97971';

@ProviderFor(basketLocalDataSource)
const basketLocalDataSourceProvider = BasketLocalDataSourceProvider._();

final class BasketLocalDataSourceProvider
    extends
        $FunctionalProvider<
          BasketLocalDataSource,
          BasketLocalDataSource,
          BasketLocalDataSource
        >
    with $Provider<BasketLocalDataSource> {
  const BasketLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'basketLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$basketLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<BasketLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BasketLocalDataSource create(Ref ref) {
    return basketLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BasketLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BasketLocalDataSource>(value),
    );
  }
}

String _$basketLocalDataSourceHash() =>
    r'1d8c60997c81c018afcc030daf2e89e6f649651b';
