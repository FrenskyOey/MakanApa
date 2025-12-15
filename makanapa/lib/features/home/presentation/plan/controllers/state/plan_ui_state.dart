import 'package:makanapa/core/states/data_state.dart';
import 'package:makanapa/features/home/domain/models/weekly_plan.dart';

class PlanUiState {
  final DataState<String> state;
  final WeeklyPlan? data;

  PlanUiState({this.state = const Initial<String>(), this.data});

  PlanUiState copyWith({DataState<String>? state, WeeklyPlan? data}) {
    return PlanUiState(state: state ?? this.state, data: data ?? this.data);
  }
}
