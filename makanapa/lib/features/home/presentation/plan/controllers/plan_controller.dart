import 'dart:async';

import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/state/plan_event_state.dart';
import 'package:makanapa/features/home/presentation/plan/controllers/state/plan_ui_state.dart';
import 'package:makanapa/features/home/provider/plan_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'plan_controller.g.dart';

@riverpod
class PlanController extends _$PlanController {
  late MealPlanRepository _repo;

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

  /*
  Future<void> loadData() async {
    // do something here 
    final repository = await ref.read(templateRepositoryProvider.future);
    final result = await repository.getTemplate();
    state = .....
  }*/
}
