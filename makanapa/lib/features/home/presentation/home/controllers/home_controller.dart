import 'dart:async';

import 'package:makanapa/core/handlers/log/log_helper.dart';
import 'package:makanapa/features/home/domain/models/avaiblity_item.dart';
import 'package:makanapa/features/home/domain/repositories/meal_plan_repository.dart';
import 'package:makanapa/features/home/presentation/home/controllers/state/home_event_state.dart';
import 'package:makanapa/features/home/presentation/home/controllers/state/home_ui_state.dart';

import 'package:makanapa/features/home/provider/plan_provider.dart';
import 'package:makanapa/features/recipe/domain/models/recipe_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  late MealPlanRepository _repo;
  StreamSubscription? _dashboardSubscription;

  final _eventController = StreamController<HomeEventState>.broadcast();
  Stream<HomeEventState> get events => _eventController.stream;

  @override
  HomeUiState build() {
    _repo = ref.read(mealPlanRepositoryProvider);
    _initStream();

    ref.onDispose(() {
      _dashboardSubscription?.cancel();
      _eventController.close();
    });
    return HomeUiState();
  }

  void _initStream() async {
    final streams = _repo.getDashboardStream();
    _dashboardSubscription = streams.listen((dashboards) {
      if (dashboards == null) {
        return;
      }
      state = state.copyWith(hideLoading: true, dashboardData: dashboards);
    });
  }

  Future<void> reloadDashboardData() async {
    state = state.copyWith(hideLoading: false, errorMessages: null);
    await Future.delayed(Duration(seconds: 2));
    final results = await _repo.getDashboardData();
    results.fold(
      (l) {
        LogHelper.debug("Errors : $l");
        if (state.dashboardData == null) {
          state = state.copyWith(
            hideLoading: true,
            errorMessages: "Ada yang error mohon coba lagi",
          );
        } else {
          state = state.copyWith(hideLoading: true);
          _eventController.add(
            HomeEventState.toastError("Ada yang error mohon coba lagi"),
          );
        }
      },
      (r) {
        state = state.copyWith(hideLoading: true);
      },
    );
  }

  void createPlans(AvaiblityItem item) async {
    _eventController.add(HomeEventState.openCreatePlan(item));
  }

  void toDetailrecipe(RecipeItem item) {
    _eventController.add(HomeEventState.openRecipeDetail(item));
  }

  void toPlanDetail(int groupId) {
    _eventController.add(HomeEventState.openPlanDetail(groupId));
  }
}
