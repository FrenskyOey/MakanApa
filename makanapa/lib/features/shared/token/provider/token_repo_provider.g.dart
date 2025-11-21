// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_repo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tokenRemoteDataSource)
const tokenRemoteDataSourceProvider = TokenRemoteDataSourceProvider._();

final class TokenRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          TokenRemoteDataSource,
          TokenRemoteDataSource,
          TokenRemoteDataSource
        >
    with $Provider<TokenRemoteDataSource> {
  const TokenRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TokenRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TokenRemoteDataSource create(Ref ref) {
    return tokenRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenRemoteDataSource>(value),
    );
  }
}

String _$tokenRemoteDataSourceHash() =>
    r'c70bbde41fda970d93fac5c4f7c4f2c3d1078476';

@ProviderFor(tokenLocalDataSource)
const tokenLocalDataSourceProvider = TokenLocalDataSourceProvider._();

final class TokenLocalDataSourceProvider
    extends
        $FunctionalProvider<
          TokenLocalDataSource,
          TokenLocalDataSource,
          TokenLocalDataSource
        >
    with $Provider<TokenLocalDataSource> {
  const TokenLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<TokenLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TokenLocalDataSource create(Ref ref) {
    return tokenLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenLocalDataSource>(value),
    );
  }
}

String _$tokenLocalDataSourceHash() =>
    r'fa7b94ff5ad2469affd6f75b89a9235704891451';

@ProviderFor(tokenRepository)
const tokenRepositoryProvider = TokenRepositoryProvider._();

final class TokenRepositoryProvider
    extends
        $FunctionalProvider<TokenRepository, TokenRepository, TokenRepository>
    with $Provider<TokenRepository> {
  const TokenRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenRepositoryHash();

  @$internal
  @override
  $ProviderElement<TokenRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TokenRepository create(Ref ref) {
    return tokenRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenRepository>(value),
    );
  }
}

String _$tokenRepositoryHash() => r'25c124bd9ca64f53f302e6c9cb4c89a3ddc540ac';
