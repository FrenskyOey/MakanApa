import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/side_effect_mixin.dart';
import 'package:makanapa/features/basket/domain/repositories/basket_repository.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_event.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_ui_state.dart';

class BasketDetailBloc extends Bloc<BasketDetailEvent, BasketDetailUiState>
    with SideEffectMixin<BasketDetailEvent, BasketDetailUiState> {
  final BasketRepository _repository;
  //StreamSubscription<RecipeDetail?>? _recipeSubscription;

  BasketDetailBloc({required BasketRepository repository})
    : _repository = repository,
      super(BasketDetailUiState()) {
    // register event Handler
    on<LoadDataEvent>(_onLoadData);
  }

  Future<void> _onLoadData(
    LoadDataEvent event,
    Emitter<BasketDetailUiState> emit,
  ) async {}

  @override
  Future<void> close() {
    //_recipeSubscription?.cancel();
    return super.close();
  }
}
