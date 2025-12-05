import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/side_effect_mixin.dart';
import 'package:makanapa/core/handlers/log/log_helper.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/state/search_effect.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/state/search_event.dart';
import 'package:makanapa/features/recipe/presentation/search/controllers/state/search_ui_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchUiState>
    with SideEffectMixin<SearchEffect, SearchUiState> {
  final RecipeRepository _repository;
  StreamSubscription<List<RecipeItem>?>? _recipeSubscription;

  Map<String, List<RecipeItem>> cache = {};
  Timer? _debounce;
  Timer? _preLoadings;
  CancelToken? _cancelToken;

  SearchBloc({required RecipeRepository repository})
    : _repository = repository,
      super(SearchUiState()) {
    on<SearchRecipeEvent>(_onSearchEvent);
    on<UpdateSearchStreamEvent>(_onUpdateSearchStream);
    on<OpenDetailRecipeEvent>(_onOpenDetailRecipe);
    on<InternalSearchEvent>(_search);
  }

  void _initDataSubscribtion() {
    LogHelper.debug("initDataSubscribtion called");
    _recipeSubscription = _repository.getSearchStream().listen((recipeData) {
      if (isClosed) {
        return;
      }
      add(UpdateSearchStreamEvent(recipeData));
    });
  }

  void _onOpenDetailRecipe(
    OpenDetailRecipeEvent event,
    Emitter<SearchUiState> emit,
  ) {
    emitEffect(SearchEffect.openDetailPage(event.item));
  }

  Future<void> _onSearchEvent(
    SearchRecipeEvent event,
    Emitter<SearchUiState> emit,
  ) async {
    String query = event.searchKey;

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    emit(state.copyWith(isLoading: true, errorMessage: "", isInitial: false));
    _debounce = Timer(Duration(milliseconds: 400), () {
      add(InternalSearchEvent(query));
    });
  }

  Future<void> _onUpdateSearchStream(
    UpdateSearchStreamEvent event,
    Emitter<SearchUiState> emit,
  ) async {
    final data = event.items;
    emit(state.copyWith(results: data, isLoading: false, isInitial: false));
  }

  Future<void> _search(
    InternalSearchEvent event,
    Emitter<SearchUiState> emit,
  ) async {
    if (_recipeSubscription == null) {
      _initDataSubscribtion();
    }

    if (_preLoadings?.isActive ?? false) _preLoadings!.cancel();
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    emit(state.copyWith(currentQuery: event.query));

    final result = await _repository.searchRecipes(
      query: event.query,
      token: _cancelToken!,
    );

    if (isClosed) {
      return;
    }

    result.fold(
      (errorMessage) {
        if (state.isEmpty) {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: "Gagal Ambil Data | Query : ${state.currentQuery}",
            ),
          );
          return;
        }

        emitEffect(
          SearchEffect.toastError(
            "Gagal Ambil Data | Query : ${state.currentQuery}",
          ),
        );
      },
      (result) {
        //emit(state.copyWith(isLoading: false));
        // save to cache for later use
      },
    );
  }

  @override
  Future<void> close() {
    _recipeSubscription?.cancel();
    _recipeSubscription = null;

    _debounce?.cancel();
    _cancelToken?.cancel();
    return super.close();
  }
}
