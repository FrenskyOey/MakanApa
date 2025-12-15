import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_plan_response.freezed.dart';
part 'create_plan_response.g.dart';

@freezed
abstract class CreatePlanResponse with _$CreatePlanResponse {
  const factory CreatePlanResponse({
    @JsonKey(name: 'group_id') required int groupId,
    @JsonKey(name: 'message') required String message,
  }) = _CreatePlanResponse;

  factory CreatePlanResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePlanResponseFromJson(json);
}
