import 'package:equatable/equatable.dart';

class UpcomingItem extends Equatable {
  final int groupId;
  final DateTime startDate;

  const UpcomingItem({required this.groupId, required this.startDate});

  @override
  List<Object?> get props => [groupId, startDate];
}
