import 'dart:async';

import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:makanapa/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_event_state.dart';
import 'package:makanapa/features/recipe/presentation/list/controllers/state/recipe_ui_state.dart';
import 'package:makanapa/features/recipe/provider/recipe_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_controller.g.dart';

@riverpod
class RecipeController extends _$RecipeController {
  late RecipeRepository _repo;
  StreamSubscription? _recipeSubscription;
  final _eventController = StreamController<RecipeListEventState>.broadcast();
  Stream<RecipeListEventState> get events => _eventController.stream;

  bool _isFetching = false;
  bool _hasMoreData = true;

  int _currentPage = 1;

  @override
  RecipeUiState build() {
    _repo = ref.read(recipeRepositoryProvider);
    ref.onDispose(() {
      _recipeSubscription?.cancel();
      _eventController.close();
    });
    return RecipeUiState();
  }

  // --- INTERNAL: MANAGE SUBSCRIPTION ---
  void _startDbObservation() {
    // Cancel any existing subscription (important when limit changes)
    _recipeSubscription?.cancel();

    // Create new subscription based on current Page Limit & Filter
    _recipeSubscription = _repo
        .getReceiptStream(pageIndex: _currentPage, filter: state.currentFilter)
        .listen((localData) {
          final pageState = state.state;
          if ((pageState is Success) == false) {
            state = state.copyWith(
              showPageLoading: false,
              showRefreshLoading: false,
              state: Success("Loaded"),
              recipeList: localData,
            );
          } else {
            state = state.copyWith(
              showPageLoading: false,
              showRefreshLoading: false,
              recipeList: localData,
            );
          }
        });
  }

  Future<void> changeFilterData({required String filter}) async {
    if (_isFetching) {
      return;
    }

    final String? filterData = filter.isEmpty ? null : filter;
    final String? currentFilterData = state.currentFilter;

    if (filterData == currentFilterData) {
      return;
    }

    state = state.copyWith(currentFilter: filter);
    reloadRecipeData();
  }

  void openDetailPage(RecipeItem item) {
    _eventController.add(RecipeListEventState.openReceiptDetail(item.id));
  }

  Future<void> reloadRecipeData({bool fromPullRefresh = false}) async {
    if (_isFetching || !_hasMoreData) {
      return;
    }
    _isFetching = true;

    if (fromPullRefresh) {
      state = state.copyWith(showRefreshLoading: true, isSyncing: true);
    } else {
      state = state.copyWith(
        state: const Loading<String>(),
        recipeList: const [],
        isSyncing: true,
      );
    }

    // intentionally delayed to avoid blink loading effect
    await Future.delayed(Duration(milliseconds: 1500));
    if (!ref.mounted) {
      return;
    }

    _currentPage = 1;
    _hasMoreData = true;

    _startDbObservation();

    final results = await _repo.getReceiptPage(
      pageIndex: _currentPage,
      filter: state.currentFilter,
    );

    if (!ref.mounted) {
      return;
    }

    results.fold(
      (l) async {
        final pageLocal = await _repo.getLocalReceiptPage(
          pageIndex: _currentPage,
          filter: state.currentFilter,
        );

        if (pageLocal == null) {
          state = state.copyWith(state: Error(l));
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
    state = state.copyWith(showRefreshLoading: false, isSyncing: false);
  }

  Future<void> loadNextData() async {
    if (_isFetching || !_hasMoreData) {
      return;
    }

    _isFetching = true;
    state = state.copyWith(showPageLoading: true, isSyncing: true);

    // intentionally delayed to avoid blink loading effect
    await Future.delayed(Duration(milliseconds: 1500));
    if (!ref.mounted) {
      return;
    }

    _currentPage = _currentPage + 1;
    _startDbObservation();

    final results = await _repo.getReceiptPage(
      pageIndex: _currentPage,
      filter: state.currentFilter,
    );
    if (!ref.mounted) {
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
          _eventController.add(RecipeListEventState.toastError(l));
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
    state = state.copyWith(showPageLoading: false, isSyncing: false);
  }
}
