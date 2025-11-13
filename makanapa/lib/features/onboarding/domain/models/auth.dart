import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

@freezed
abstract class AuthData with _$AuthData {
  const factory AuthData({
    @Default("") String email,
    @Default("") String provider,
    @Default("") String role,
    @Default("") String userId,
  }) = _AuthData;
}
