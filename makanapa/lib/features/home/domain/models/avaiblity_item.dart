import 'package:equatable/equatable.dart';

class AvaiblityItem extends Equatable {
  final DateTime startDate;
  final DateTime endDate;
  const AvaiblityItem({required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}
