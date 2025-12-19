import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanapa/core/extension/side_effect_mixin.dart';
import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/basket/domain/models/basket_group.dart';
import 'package:makanapa/features/basket/domain/models/basket_option.dart';
import 'package:makanapa/features/basket/domain/repositories/basket_repository.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_effect.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_event.dart';
import 'package:makanapa/features/basket/presentation/main/controllers/state/basket_ui_state.dart';
import 'package:makanapa/features/recipe/domain/models/ingredient_enum.dart';

class BasketBloc extends Bloc<BasketEvent, BasketUiState>
    with SideEffectMixin<BasketEffect, BasketUiState> {
  final BasketRepository _repository;
  StreamSubscription<BasketSummary>? _summaryData;
  StreamSubscription<BasketGroup>? _vegetableGroup;
  StreamSubscription<BasketGroup>? _meatGroup;
  StreamSubscription<BasketGroup>? _otherGroup;

  BasketBloc({required BasketRepository repository})
    : _repository = repository,
      super(BasketUiState()) {
    // register event Handler
    on<LoadMainDataEvent>(_onLoadData);
    on<MarkingItemEvent>(_onMarkingItem);
    on<OpenDetailItemEvent>(_onOpenDetailItem);
    on<SummaryUpdateStreamEvent>(_onUpdateSummary);
    on<IngredientsGroupdEvent>(_onUpdateIngredients);
  }

  Future<void> _onLoadData(
    LoadMainDataEvent event,
    Emitter<BasketUiState> emit,
  ) async {
    emit(state.copyWith(state: const Loading()));

    await _summaryData?.cancel();
    await Future.delayed(Duration(seconds: 2));

    if (isClosed) {
      return;
    }

    _summaryData = _repository.getIngredientOption().listen((data) {
      if (isClosed) {
        return;
      }
      add(SummaryUpdateStreamEvent(data));
    });

    final result = await _repository.getIngredientsSummary();

    if (isClosed) {
      return;
    }
    result.fold(
      (errorMessage) {
        if ((state.state is Success) == false) {
          emit(state.copyWith(state: Error(errorMessage)));
          emitEffect(BasketEffect.toastError("Gagal Ambil Data"));
        }
      },
      (result) {
        if (result.currentGroup == null) {
          emit(
            state.copyWith(
              state: Success(""),
              vegetableBasket: const [],
              meatBasket: const [],
              otherBasket: const [],
            ),
          );
          return;
        }
      },
    );
  }

  Future<void> _onMarkingItem(
    MarkingItemEvent event,
    Emitter<BasketUiState> emit,
  ) async {
    final result = await _repository.updateMark(
      groupId: event.groupId,
      ingredientId: event.ingredientsId,
      isMarked: event.isMarking,
    );
    result.fold(
      (errorMessage) => emitEffect(BasketEffect.toastError(errorMessage)),
      (_) {},
    );
  }

  Future<void> _onOpenDetailItem(
    OpenDetailItemEvent event,
    Emitter<BasketUiState> emit,
  ) async {
    emitEffect(BasketEffect.openUpcomingItem(event.item));
  }

  Future<void> _onUpdateSummary(
    SummaryUpdateStreamEvent event,
    Emitter<BasketUiState> emit,
  ) async {
    if (isClosed) {
      return;
    }
    final groupId = event.data.currentGroup?.groupId;

    emit(
      state.copyWith(
        summaryData: event.data,
        upcomingData: event.data.upcomingGroup,
      ),
    );
    if (groupId != null) {
      emit(state.copyWith(state: Loading()));
      _initIngredientsSteam(groupId);
    } else {
      emit(state.copyWith(state: Success("")));
    }
  }

  Future<void> _onUpdateIngredients(
    IngredientsGroupdEvent event,
    Emitter<BasketUiState> emit,
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

    if ((state.state is Success) == false) {
      emit(state.copyWith(state: Success("")));
    }
  }

  @override
  Future<void> close() {
    _summaryData?.cancel();
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
