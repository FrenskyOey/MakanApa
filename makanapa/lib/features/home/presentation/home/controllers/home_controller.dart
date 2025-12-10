import 'dart:async';

import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/home/controllers/state/home_event_state.dart';
import 'package:makanapa/features/home/presentation/home/controllers/state/home_ui_state.dart';

import 'package:makanapa/features/home/provider/plan_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  late MealPlanRepository _repo;

  final _eventController = StreamController<HomeEventState>.broadcast();
  Stream<HomeEventState> get events => _eventController.stream;

  @override
  HomeUiState build() {
    _repo = ref.read(mealPlanRepositoryProvider);
    ref.onDispose(() {
      _eventController.close();
    });
    return HomeUiState();
  }

  /*
  Future<void> loadData() async {
    // do something here 
    final repository = await ref.read(templateRepositoryProvider.future);
    final result = await repository.getTemplate();
    state = .....
  }*/
}
