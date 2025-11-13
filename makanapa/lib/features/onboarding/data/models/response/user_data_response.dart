import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

part 'user_data_response.freezed.dart';
part 'user_data_response.g.dart';

@freezed
abstract class UserDataResponse with _$UserDataResponse {
  const UserDataResponse._();

  const factory UserDataResponse({
    @JsonKey(name: 'uid', defaultValue: '') required String userId,
    @JsonKey(name: 'user_name', defaultValue: '') required String name,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'phone_number', defaultValue: '') required String phone,
    @JsonKey(name: 'avatar', defaultValue: '') required String avatar,
    @JsonKey(name: 'salt_code', defaultValue: '') required String salts,
  }) = _UserDataResponse;

  // converting TemplateDTO object to Template entity
  UserData toDomain() {
    return UserData(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      avatar: avatar,
    );
  }

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);
}
