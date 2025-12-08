// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeRemoteDataSource)
const recipeRemoteDataSourceProvider = RecipeRemoteDataSourceProvider._();

final class RecipeRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          RecipeRemoteDataSource,
          RecipeRemoteDataSource,
          RecipeRemoteDataSource
        >
    with $Provider<RecipeRemoteDataSource> {
  const RecipeRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<RecipeRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipeRemoteDataSource create(Ref ref) {
    return recipeRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeRemoteDataSource>(value),
    );
  }
}

String _$recipeRemoteDataSourceHash() =>
    r'f06d9d1d05fadac773e356c801d3976dc85f05db';

@ProviderFor(recipeLocalDataSource)
const recipeLocalDataSourceProvider = RecipeLocalDataSourceProvider._();

final class RecipeLocalDataSourceProvider
    extends
        $FunctionalProvider<
          RecipeLocalDataSource,
          RecipeLocalDataSource,
          RecipeLocalDataSource
        >
    with $Provider<RecipeLocalDataSource> {
  const RecipeLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<RecipeLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipeLocalDataSource create(Ref ref) {
    return recipeLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeLocalDataSource>(value),
    );
  }
}

String _$recipeLocalDataSourceHash() =>
    r'1dc13507b64e56930e8354a768f2bc60e5ff3a1a';

@ProviderFor(recipeRepository)
const recipeRepositoryProvider = RecipeRepositoryProvider._();

final class RecipeRepositoryProvider
    extends
        $FunctionalProvider<
          RecipeRepository,
          RecipeRepository,
          RecipeRepository
        >
    with $Provider<RecipeRepository> {
  const RecipeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeRepositoryHash();

  @$internal
  @override
  $ProviderElement<RecipeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecipeRepository create(Ref ref) {
    return recipeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeRepository>(value),
    );
  }
}

String _$recipeRepositoryHash() => r'156cf7b678a312aba3028db288990ca58a29b418';
