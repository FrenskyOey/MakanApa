// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthDataResponse _$AuthDataResponseFromJson(Map<String, dynamic> json) =>
    _AuthDataResponse(
      userId: json['id'] as String? ?? '',
      role: json['role'] as String? ?? '',
      email: json['email'] as String? ?? '',
      provider: json['provider'] as String? ?? '',
      token: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$AuthDataResponseToJson(_AuthDataResponse instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'role': instance.role,
      'email': instance.email,
      'provider': instance.provider,
      'accessToken': instance.token,
      'refreshToken': instance.refreshToken,
    };
