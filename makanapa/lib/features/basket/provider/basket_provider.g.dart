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

@ProviderFor(basketRepository)
const basketRepositoryProvider = BasketRepositoryProvider._();

final class BasketRepositoryProvider
    extends
        $FunctionalProvider<
          BasketRepository,
          BasketRepository,
          BasketRepository
        >
    with $Provider<BasketRepository> {
  const BasketRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'basketRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$basketRepositoryHash();

  @$internal
  @override
  $ProviderElement<BasketRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BasketRepository create(Ref ref) {
    return basketRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BasketRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BasketRepository>(value),
    );
  }
}

String _$basketRepositoryHash() => r'c9799f91db4139777e45908271217e8ff9115100';
