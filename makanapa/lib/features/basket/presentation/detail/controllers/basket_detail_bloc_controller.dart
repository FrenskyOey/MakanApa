import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/side_effect_mixin.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/repositories/basket_repository.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_effect.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_event.dart';
import 'package:makanapa/features/basket/presentation/detail/controllers/state/basket_detail_ui_state.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

class BasketDetailBloc extends Bloc<BasketDetailEvent, BasketDetailUiState>
    with SideEffectMixin<BasketDetailEffect, BasketDetailUiState> {
  final BasketRepository _repository;
  StreamSubscription<BasketGroup>? _vegetableGroup;
  StreamSubscription<BasketGroup>? _meatGroup;
  StreamSubscription<BasketGroup>? _otherGroup;

  BasketDetailBloc({required BasketRepository repository})
    : _repository = repository,
      super(BasketDetailUiState()) {
    // register event Handler
    on<LoadDetailEvent>(_onLoadData);
    on<MarkingItemEvent>(_onMarkingItem);
    on<OpenPlanDetailEvent>(_onOpenPlanItem);
    on<IngredientsGroupdEvent>(_onUpdateIngredients);
  }

  Future<void> _onLoadData(
    LoadDetailEvent event,
    Emitter<BasketDetailUiState> emit,
  ) async {
    emit(
      state.copyWith(
        state: const Loading(),
        detailData: event.item,
        isDataLoaded: false,
      ),
    );
    await Future.delayed(Duration(milliseconds: 500));

    if (isClosed) {
      return;
    }
    _initIngredientsSteam(event.item.groupId);

    final result = await _repository.getIngridientData(
      groupId: event.item.groupId,
    );

    if (isClosed) {
      return;
    }
    result.fold(
      (errorMessage) {
        if ((state.state is Success) == false) {
          state.copyWith(state: Success(""), isDataLoaded: true);
          emitEffect(BasketDetailEffect.toastError("Gagal Ambil Data"));
        }
      },
      (result) {
        emit(state.copyWith(state: Success(""), isDataLoaded: true));
        return;
      },
    );
  }

  Future<void> _onMarkingItem(
    MarkingItemEvent event,
    Emitter<BasketDetailUiState> emit,
  ) async {
    final result = await _repository.updateMark(
      groupId: event.groupId,
      ingredientId: event.ingredientsId,
      isMarked: event.isMarking,
    );
    result.fold(
      (errorMessage) => emitEffect(BasketDetailEffect.toastError(errorMessage)),
      (_) {},
    );
  }

  Future<void> _onOpenPlanItem(
    OpenPlanDetailEvent event,
    Emitter<BasketDetailUiState> emit,
  ) async {
    emitEffect(BasketDetailEffect.openPlanDetail(event.groupId));
  }

  Future<void> _onUpdateIngredients(
    IngredientsGroupdEvent event,
    Emitter<BasketDetailUiState> emit,
  ) async {
    if (isClosed) {
      return;
    }

    final type = IngredientEnum.fromDescription(event.data.type);

    switch (type) {
      case IngredientEnum.vegetable:
        emit(state.copyWith(vegetableBasket: event.data.data));
        break;
      case IngredientEnum.meat:
        emit(state.copyWith(meatBasket: event.data.data));
        break;
      case IngredientEnum.other:
        emit(state.copyWith(otherBasket: event.data.data));
        break;
      case IngredientEnum.nulls:
        // do nothing for nulls
        break;
    }
  }

  @override
  Future<void> close() {
    _vegetableGroup?.cancel();
    _meatGroup?.cancel();
    _otherGroup?.cancel();
    return super.close();
  }

  void _initIngredientsSteam(int groupId) async {
    await _vegetableGroup?.cancel();
    await _meatGroup?.cancel();
    await _otherGroup?.cancel();

    _vegetableGroup = _repository
        .getBasketData(groupId: groupId, type: IngredientEnum.vegetable)
        .listen((data) {
          if (isClosed) {
            return;
          }
          add(IngredientsGroupdEvent(data));
        });

    _meatGroup = _repository
        .getBasketData(groupId: groupId, type: IngredientEnum.meat)
        .listen((data) {
          if (isClosed) {
            return;
          }
          add(IngredientsGroupdEvent(data));
        });

    _otherGroup = _repository
        .getBasketData(groupId: groupId, type: IngredientEnum.other)
        .listen((data) {
          if (isClosed) {
            return;
          }
          add(IngredientsGroupdEvent(data));
        });
  }
}
