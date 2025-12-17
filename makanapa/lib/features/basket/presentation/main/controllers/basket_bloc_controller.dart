import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/side_effect_mixin.dart';
import 'package:makanapa/features/basket/domain/repositories/basket_repository.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_event.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketUiState>
    with SideEffectMixin<BasketEvent, BasketUiState> {
  final BasketRepository _repository;
  //StreamSubscription<RecipeDetail?>? _recipeSubscription;

  BasketBloc({required BasketRepository repository})
    : _repository = repository,
      super(BasketUiState()) {
    // register event Handler
    on<LoadDataEvent>(_onLoadData);
  }

  Future<void> _onLoadData(
    LoadDataEvent event,
    Emitter<BasketUiState> emit,
  ) async {}

  @override
  Future<void> close() {
    //_recipeSubscription?.cancel();
    return super.close();
  }
}
