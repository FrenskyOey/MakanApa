import 'package:makanapa/features/home/presentation/create/model/create_item_model.dart';

class CreateUiState {
  final bool showLoading;
  final DateTime startDate;
  final DateTime endDate;
  final List<CreateItem> formItem;

  CreateUiState({
    this.showLoading = false,
    DateTime? startDate,
    DateTime? endDate,
    this.formItem = const [],
  }) : startDate = startDate ?? DateTime.now(),
       endDate = endDate ?? DateTime.now();

  CreateUiState copyWith({
    bool? showLoading,
    List<CreateItem>? formItem,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return CreateUiState(
      showLoading: showLoading ?? this.showLoading,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      formItem: formItem ?? this.formItem,
    );
  }
}
