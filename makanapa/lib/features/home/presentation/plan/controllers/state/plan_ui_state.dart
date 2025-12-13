import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

class PlanUiState {
  final DataState<WeeklyPlan> state;

  PlanUiState({this.state = const Initial<WeeklyPlan>()});

  PlanUiState copyWith({DataState<WeeklyPlan>? state}) {
    return PlanUiState(state: state ?? this.state);
  }
}
