// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    _UserDataResponse(
      userId: json['uid'] as String? ?? '',
      name: json['user_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone_number'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      salts: json['salt_code'] as String? ?? '',
    );

Map<String, dynamic> _$UserDataResponseToJson(_UserDataResponse instance) =>
    <String, dynamic>{
      'uid': instance.userId,
      'user_name': instance.name,
      'email': instance.email,
      'phone_number': instance.phone,
      'avatar': instance.avatar,
      'salt_code': instance.salts,
    };
