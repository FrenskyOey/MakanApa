import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';

part 'auth_data_response.freezed.dart';
part 'auth_data_response.g.dart';

@freezed
abstract class AuthDataResponse with _$AuthDataResponse {
  const AuthDataResponse._();

  const factory AuthDataResponse({
    @JsonKey(name: 'id', defaultValue: '') required String userId,
    @JsonKey(name: 'role', defaultValue: '') required String role,
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'provider', defaultValue: '') required String provider,
    @JsonKey(name: 'accessToken', defaultValue: '') required String token,
    @JsonKey(name: 'refreshToken', defaultValue: '')
    required String refreshToken,
  }) = _AuthDataResponse;

  // converting TemplateDTO object to Template entity
  AuthData toDomain() {
    return AuthData(
      email: email,
      provider: provider,
      role: role,
      userId: userId,
    );
  }

  factory AuthDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthDataResponseFromJson(json);
}
