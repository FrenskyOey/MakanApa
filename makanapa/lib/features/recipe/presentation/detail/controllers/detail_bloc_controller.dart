import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/side_effect_mixin.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_detail.dart';
import 'package:makanapa/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_effect.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_event.dart';
import 'package:makanapa/features/recipe/presentation/detail/controllers/state/detail_ui_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailUiState>
    with SideEffectMixin<DetailEffect, DetailUiState> {
  final RecipeRepository _repository;
  StreamSubscription<RecipeDetail?>? _recipeSubscription;
  bool isBookMarkProcess = false;

  DetailBloc({required RecipeRepository repository})
    : _repository = repository,
      super(DetailUiState()) {
    // register event Handler
    on<LoadDetailEvent>(_onLoadDetail);
    on<ToggleBookmarkEvent>(_onToggleBookmark);
    on<OpenUrlEvent>(_onOpenUrl);
    on<RecipeUpdateStreamEvent>(_onRecipeStreamUpdated);
  }

  Future<void> _onLoadDetail(
    LoadDetailEvent event,
    Emitter<DetailUiState> emit,
  ) async {
    emit(state.copyWith(state: const Loading()));

    await _recipeSubscription?.cancel();

    _recipeSubscription = _repository
        .getRecipeDetailStream(recipeId: (event.recipeId))
        .listen((recipeDetail) {
          if (isClosed) {
            return;
          }
          if (recipeDetail != null) {
            // adding an event because in bloc when function has ended (onloadDetail) then we cannot emit an state, so we need to trigger it by event, and save it latter
            add(RecipeUpdateStreamEvent(recipeDetail));
          }
        });

    final result = await _repository.getRecipeDetail(
      recipeId: (event.recipeId),
    );
    if (isClosed) {
      return;
    }
    result.fold((errorMessage) {
      if ((state.state is Success) == false) {
        emit(state.copyWith(state: Error(errorMessage)));
        emitEffect(DetailEffect.toastError("Gagal Ambil Data"));
      }
    }, (_) {});
  }

  Future<void> _onRecipeStreamUpdated(
    RecipeUpdateStreamEvent event,
    Emitter<DetailUiState> emit,
  ) async {
    emit(
      state.copyWith(
        bookMarkState: event.data.isBookmarked,
        state: Success(event.data),
      ),
    );
  }

  Future<void> _onToggleBookmark(
    ToggleBookmarkEvent event,
    Emitter<DetailUiState> emit,
  ) async {
    if (isBookMarkProcess) {
      return;
    }

    isBookMarkProcess = true;

    emit(state.copyWith(bookMarkState: !state.bookMarkState));

    final results = await _repository.bookmarkRecipe(recipeId: event.recipeId);

    if (isClosed) {
      return;
    }

    results.fold(
      (l) async {
        emitEffect(DetailEffect.toastSuccess("Bookmark gagal di update"));
      },
      (r) {
        emitEffect(DetailEffect.toastSuccess("Bookmark berhasil di update"));
      },
    );
    isBookMarkProcess = false;
  }

  void _onOpenUrl(OpenUrlEvent event, Emitter<DetailUiState> emit) {
    emitEffect(DetailEffect.openUrlLink(event.url));
  }

  @override
  Future<void> close() {
    _recipeSubscription?.cancel();
    return super.close();
  }
}
