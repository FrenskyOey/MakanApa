import 'package:makanapa/features/home/domain/models/dashboard.dart';

class HomeUiState {
  final bool hideLoading;
  final Dashboard? dashboardData;
  final String? errorMessages;

  HomeUiState({
    this.hideLoading = true,
    this.dashboardData,
    this.errorMessages,
  });

  HomeUiState copyWith({
    bool? hideLoading,
    Dashboard? dashboardData,
    String? errorMessages,
  }) {
    return HomeUiState(
      hideLoading: hideLoading ?? this.hideLoading,
      dashboardData: dashboardData ?? this.dashboardData,
      errorMessages: errorMessages ?? this.errorMessages,
    );
  }
}
