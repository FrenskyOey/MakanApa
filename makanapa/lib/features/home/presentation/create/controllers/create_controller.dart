import 'dart:async';

import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/create/controllers/state/create_event_state.dart';
import 'package:makanapa/features/home/presentation/create/controllers/state/create_ui_state.dart';

import 'package:makanapa/features/home/provider/plan_provider.dart';
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

  /*
  Future<void> loadData() async {
    // do something here 
    final repository = await ref.read(templateRepositoryProvider.future);
    final result = await repository.getTemplate();
    state = .....
  }*/
}
