import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/side_effect_mixin.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_list_effect.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_event.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_state.dart';

class RecipeBloc extends Bloc<RecipeUiEvent, RecipeUiState>
    with SideEffectMixin<RecipeListEffect, RecipeUiState> {
  late final RecipeRepository _repo;
  StreamSubscription? _recipeSubscription;

  bool _isFetching = false;
  bool _hasMoreData = true;
  int _currentPage = 1;

  RecipeBloc({required RecipeRepository repository})
    : _repo = repository,
      super(RecipeUiState()) {
    // register event Handler
    on<ChangeFilterDataEvent>(_changeFilterData);
    on<ReloadRecipeDataEvent>(_reloadRecipeDataEvent);
    on<LoadNextDataEvent>(_loadNextDataEvent);
    on<OpenDetailPageEvent>(_openDetailPageEvent);
    on<OpenSearchRecipeEvent>(_openSearchRecipeEvent);
    on<PageUpdateStreamEvent>(_pageUpdateStreamEvent);
  }

  // --- INTERNAL: MANAGE SUBSCRIPTION ---
  void _startDbObservation() async {
    // Cancel any existing subscription (important when limit changes)
    await _recipeSubscription?.cancel();

    // Create new subscription based on current Page Limit & Filter
    _recipeSubscription = _repo
        .getReceiptStream(pageIndex: _currentPage, filter: state.currentFilter)
        .listen((localData) {
          add(PageUpdateStreamEvent(localData));
        });
  }

  Future<void> _changeFilterData(
    ChangeFilterDataEvent event,
    Emitter<RecipeUiState> emit,
  ) async {
    final filter = event.filter;
    if (_isFetching) {
      return;
    }
    final String? filterData = filter.isEmpty ? null : filter;
    final String? currentFilterData = state.currentFilter;

    if (filterData == currentFilterData) {
      return;
    }
    emit(state.copyWith(currentFilter: filter));
    add(ReloadRecipeDataEvent());
  }

  Future<void> _reloadRecipeDataEvent(
    ReloadRecipeDataEvent event,
    Emitter<RecipeUiState> emit,
  ) async {
    if (_isFetching) {
      return;
    }
    _isFetching = true;

    if (event.fromPullRefresh) {
      emit(state.copyWith(showRefreshLoading: true, isSyncing: true));
    } else {
      emit(
        state.copyWith(
          state: const Loading<String>(),
          recipeList: const [],
          isSyncing: true,
        ),
      );
    }

    // intentionally delayed to avoid blink loading effect
    await Future.delayed(Duration(milliseconds: 1000));
    if (isClosed) {
      return;
    }

    _currentPage = 1;
    _hasMoreData = true;

    _startDbObservation();

    final results = await _repo.getReceiptPage(
      pageIndex: _currentPage,
      filter: state.currentFilter,
    );

    if (isClosed) {
      return;
    }

    results.fold(
      (l) async {
        final pageLocal = await _repo.getLocalReceiptPage(
          pageIndex: _currentPage,
          filter: state.currentFilter,
        );

        if (pageLocal == null) {
          emit(state.copyWith(state: Error(l)));
        } else {
          final counters = pageLocal.dataCounter;
          if (counters <= 0) {
            _hasMoreData = false;
          } else {
            _hasMoreData = true;
          }
        }
      },
      (r) {
        final counters = r.dataCounter;
        if (counters <= 0) {
          _hasMoreData = false;
        } else {
          _hasMoreData = true;
        }
      },
    );

    _isFetching = false;
    emit(state.copyWith(showRefreshLoading: false, isSyncing: false));
  }

  Future<void> _loadNextDataEvent(
    LoadNextDataEvent event,
    Emitter<RecipeUiState> emit,
  ) async {
    if (_isFetching || !_hasMoreData) {
      return;
    }

    _isFetching = true;
    emit(state.copyWith(showPageLoading: true, isSyncing: true));

    // intentionally delayed to avoid blink loading effect
    await Future.delayed(Duration(milliseconds: 1500));
    if (isClosed) {
      return;
    }

    _currentPage = _currentPage + 1;
    _startDbObservation();

    final results = await _repo.getReceiptPage(
      pageIndex: _currentPage,
      filter: state.currentFilter,
    );
    if (isClosed) {
      return;
    }

    results.fold(
      (l) async {
        // handling error, if error, will fetch local data  to define _hasMoreData
        final pageLocal = await _repo.getLocalReceiptPage(
          pageIndex: _currentPage,
          filter: state.currentFilter,
        );

        if (pageLocal == null) {
          // reset page to previous state
          _currentPage = _currentPage - 1;
          emitEffect(RecipeListEffect.toastError(l));
        } else {
          final counters = pageLocal.dataCounter;
          if (counters <= 0) {
            _hasMoreData = false;
          } else {
            _hasMoreData = true;
          }
        }
      },
      (r) {
        // If success, r will be a receipt page, and we can check data counter based on remote response
        final counters = r.dataCounter;
        if (counters <= 0) {
          _hasMoreData = false;
        } else {
          _hasMoreData = true;
        }
      },
    );
    _isFetching = false;
    emit(state.copyWith(showPageLoading: false, isSyncing: false));
  }

  void _openDetailPageEvent(
    OpenDetailPageEvent event,
    Emitter<RecipeUiState> emit,
  ) {
    emitEffect(RecipeListEffect.openReceiptDetail(event.item));
  }

  void _openSearchRecipeEvent(
    OpenSearchRecipeEvent event,
    Emitter<RecipeUiState> emit,
  ) {
    emitEffect(RecipeListEffect.openSearchRecipe());
  }

  void _pageUpdateStreamEvent(
    PageUpdateStreamEvent event,
    Emitter<RecipeUiState> emit,
  ) {
    final pageState = state.state;
    if ((pageState is Success) == false) {
      emit(
        state.copyWith(
          showPageLoading: false,
          showRefreshLoading: false,
          state: Success("Loaded"),
          recipeList: event.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          showPageLoading: false,
          showRefreshLoading: false,
          recipeList: event.data,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _recipeSubscription?.cancel();
    return super.close();
  }
}
