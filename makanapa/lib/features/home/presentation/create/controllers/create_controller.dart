import 'dart:async';

import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
import 'package:makanapa/features/home/domain/models/create_plan_request.dart';
import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/create/controllers/state/create_event_state.dart';
import 'package:makanapa/features/home/presentation/create/controllers/state/create_ui_state.dart';
import 'package:makanapa/features/home/presentation/create/model/create_enum.dart';
import 'package:makanapa/features/home/presentation/create/model/create_item_model.dart';

import 'package:makanapa/features/home/provider/plan_provider.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_controller.g.dart';

@riverpod
class CreateController extends _$CreateController {
  late MealPlanRepository _repo;

  final _eventController = StreamController<CreateEventState>.broadcast();
  Stream<CreateEventState> get events => _eventController.stream;

  @override
  CreateUiState build() {
    _repo = ref.read(mealPlanRepositoryProvider);
    ref.onDispose(() {
      _eventController.close();
    });
    return CreateUiState();
  }

  void initData(AvaiblityItem item) async {
    final startDate = item.startDate;
    final endDate = item.endDate;
    List<CreateItem> itemList = [];
    int indexes = 0;

    final days = endDate.difference(startDate).inDays;
    for (int i = 0; i <= days; i++) {
      itemList.add(
        CreateItem(
          indexes: indexes,
          date: startDate.add(Duration(days: i)),
        ),
      );
      indexes++;
    }
    state = state.copyWith(
      startDate: startDate,
      endDate: endDate,
      formItem: itemList,
    );
  }

  void onActionSubmited(CreateItem item, MealType type, ActionType action) {
    switch (action) {
      case ActionType.create:
        _eventController.add(CreateEventState.selectFoodPage(item, type));
        break;
      case ActionType.update:
        _eventController.add(CreateEventState.selectFoodPage(item, type));
        break;
      case ActionType.delete:
        _deleteMeal(item, type);
        break;
    }
  }

  void updateMeals(CreateItem item, MealType type, RecipeItem recipe) {
    final listData = state.formItem;
    CreateItem data = listData[item.indexes];

    switch (type) {
      case MealType.lunch:
        data = data.copyWith(lunchItem: recipe, dinnerItem: data.dinnerItem);
        break;
      case MealType.dinner:
        data = data.copyWith(lunchItem: data.lunchItem, dinnerItem: recipe);
    }
    listData[item.indexes] = data;
    state = state.copyWith(formItem: listData);
  }

  void _deleteMeal(CreateItem item, MealType type) {
    final listData = state.formItem;
    CreateItem data = listData[item.indexes];

    switch (type) {
      case MealType.lunch:
        data = data.copyWith(lunchItem: null, dinnerItem: data.dinnerItem);
        break;
      case MealType.dinner:
        data = data.copyWith(lunchItem: data.lunchItem, dinnerItem: null);
    }
    listData[item.indexes] = data;
    state = state.copyWith(formItem: listData);
  }

  Future<void> createPlan() async {
    final listData = state.formItem;
    // first validate whether at least one item have a non nullable lunchItem or non nullable dinnerItem
    final hasItem = listData.any(
      (e) => e.lunchItem != null || e.dinnerItem != null,
    );

    // if everything is empty then trigger toastError into _eventController
    if (!hasItem) {
      _eventController.add(
        const CreateEventState.toastError(
          'Anda belum memilih makanan untuk plan minggu ini',
        ),
      );
      return;
    }

    // if not continue to creation
    state = state.copyWith(showLoading: true);

    // convert state data into CreatePlanRequest
    final dailyInputs = listData
        .map(
          (e) => DailyPlanInput(
            date: e.date,
            lunchId: e.lunchItem?.id,
            dinnerId: e.dinnerItem?.id,
          ),
        )
        .toList();

    final CreatePlanRequest request = CreatePlanRequest(
      startDate: state.startDate,
      endDate: state.endDate,
      dailyInputs: dailyInputs,
    );

    final result = await _repo.createMealPlan(request);

    result.fold(
      (l) {
        state = state.copyWith(showLoading: false);
        _eventController.add(CreateEventState.toastError(l));
      },
      (r) {
        state = state.copyWith(showLoading: false);
        _eventController.add(const CreateEventState.closePage());
      },
    );
  }
}
