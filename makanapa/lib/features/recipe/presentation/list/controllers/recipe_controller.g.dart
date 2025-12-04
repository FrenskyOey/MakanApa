// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecipeController)
const recipeControllerProvider = RecipeControllerProvider._();

final class RecipeControllerProvider
    extends $NotifierProvider<RecipeController, RecipeUiState> {
  const RecipeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeControllerHash();

  @$internal
  @override
  RecipeController create() => RecipeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeUiState>(value),
    );
  }
}

String _$recipeControllerHash() => r'c15f2bb832e23a86fbf668ea8579303d66daba9f';

abstract class _$RecipeController extends $Notifier<RecipeUiState> {
  RecipeUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RecipeUiState, RecipeUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecipeUiState, RecipeUiState>,
              RecipeUiState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
