class CreatePlanRequest {
  final DateTime startDate;
  final DateTime endDate;
  final List<DailyPlanInput> dailyInputs;

  const CreatePlanRequest({
    required this.startDate,
    required this.endDate,
    required this.dailyInputs,
  });
}

class DailyPlanInput {
  final DateTime date;
  final int? lunchId;
  final int? dinnerId;

  const DailyPlanInput({required this.date, this.lunchId, this.dinnerId});
}
