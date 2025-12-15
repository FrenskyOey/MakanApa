import 'dart:async';

import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';
import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/state/plan_event_state.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/state/plan_ui_state.dart';
import 'package:makanapa/features/home/provider/plan_provider.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plan_controller.g.dart';

@riverpod
class PlanController extends _$PlanController {
  late MealPlanRepository _repo;

  StreamSubscription<WeeklyPlan?>? _planSubscription;

  final _eventController = StreamController<PlanEventState>.broadcast();
  Stream<PlanEventState> get events => _eventController.stream;

  @override
  PlanUiState build() {
    _repo = ref.read(mealPlanRepositoryProvider);
    ref.onDispose(() {
      _eventController.close();
    });
    return PlanUiState();
  }

  Future<void> loadData(int groupId) async {
    state = state.copyWith(state: Loading());
    await _planSubscription?.cancel();

    await Future.delayed(const Duration(milliseconds: 500));
    if (!ref.mounted) {
      return;
    }

    _planSubscription = _repo.getWeeklyPlanStream(groupId).listen((groupData) {
      if (!ref.mounted) {
        return;
      }
      if (groupData != null) {
        state = state.copyWith(state: Success(""), data: groupData);
      }
    });

    final result = await _repo.reloadPlanDetail(groupId);

    if (!ref.mounted) {
      return;
    }

    result.fold((errorMessage) {
      if ((state.state is Success) == false) {
        state = state.copyWith(state: Error(errorMessage));
      }
    }, (_) {});
  }

  void toDetailrecipe(RecipeItem item) {
    _eventController.add(PlanEventState.openRecipeDetail(item));
  }
}
