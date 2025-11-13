import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    @Default("") String userId,
    @Default("") String name,
    @Default("") String email,
    @Default(null) String? phone,
    @Default(null) String? avatar,
  }) = _UserData;
}
