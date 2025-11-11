// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthDataResponse {

@JsonKey(name: 'id', defaultValue: '') String get userId;@JsonKey(name: 'role', defaultValue: '') String get role;@JsonKey(name: 'email', defaultValue: '') String get email;@JsonKey(name: 'provider', defaultValue: '') String get provider;@JsonKey(name: 'accessToken', defaultValue: '') String get token;@JsonKey(name: 'refreshToken', defaultValue: '') String get refreshToken;
/// Create a copy of AuthDataResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthDataResponseCopyWith<AuthDataResponse> get copyWith => _$AuthDataResponseCopyWithImpl<AuthDataResponse>(this as AuthDataResponse, _$identity);

  /// Serializes this AuthDataResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthDataResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.email, email) || other.email == email)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,role,email,provider,token,refreshToken);

@override
String toString() {
  return 'AuthDataResponse(userId: $userId, role: $role, email: $email, provider: $provider, token: $token, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $AuthDataResponseCopyWith<$Res>  {
  factory $AuthDataResponseCopyWith(AuthDataResponse value, $Res Function(AuthDataResponse) _then) = _$AuthDataResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: '') String userId,@JsonKey(name: 'role', defaultValue: '') String role,@JsonKey(name: 'email', defaultValue: '') String email,@JsonKey(name: 'provider', defaultValue: '') String provider,@JsonKey(name: 'accessToken', defaultValue: '') String token,@JsonKey(name: 'refreshToken', defaultValue: '') String refreshToken
});




}
/// @nodoc
class _$AuthDataResponseCopyWithImpl<$Res>
    implements $AuthDataResponseCopyWith<$Res> {
  _$AuthDataResponseCopyWithImpl(this._self, this._then);

  final AuthDataResponse _self;
  final $Res Function(AuthDataResponse) _then;

/// Create a copy of AuthDataResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? role = null,Object? email = null,Object? provider = null,Object? token = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthDataResponse].
extension AuthDataResponsePatterns on AuthDataResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthDataResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthDataResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthDataResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthDataResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthDataResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthDataResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: '')  String userId, @JsonKey(name: 'role', defaultValue: '')  String role, @JsonKey(name: 'email', defaultValue: '')  String email, @JsonKey(name: 'provider', defaultValue: '')  String provider, @JsonKey(name: 'accessToken', defaultValue: '')  String token, @JsonKey(name: 'refreshToken', defaultValue: '')  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthDataResponse() when $default != null:
return $default(_that.userId,_that.role,_that.email,_that.provider,_that.token,_that.refreshToken);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: '')  String userId, @JsonKey(name: 'role', defaultValue: '')  String role, @JsonKey(name: 'email', defaultValue: '')  String email, @JsonKey(name: 'provider', defaultValue: '')  String provider, @JsonKey(name: 'accessToken', defaultValue: '')  String token, @JsonKey(name: 'refreshToken', defaultValue: '')  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _AuthDataResponse():
return $default(_that.userId,_that.role,_that.email,_that.provider,_that.token,_that.refreshToken);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: '')  String userId, @JsonKey(name: 'role', defaultValue: '')  String role, @JsonKey(name: 'email', defaultValue: '')  String email, @JsonKey(name: 'provider', defaultValue: '')  String provider, @JsonKey(name: 'accessToken', defaultValue: '')  String token, @JsonKey(name: 'refreshToken', defaultValue: '')  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _AuthDataResponse() when $default != null:
return $default(_that.userId,_that.role,_that.email,_that.provider,_that.token,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthDataResponse extends AuthDataResponse {
  const _AuthDataResponse({@JsonKey(name: 'id', defaultValue: '') required this.userId, @JsonKey(name: 'role', defaultValue: '') required this.role, @JsonKey(name: 'email', defaultValue: '') required this.email, @JsonKey(name: 'provider', defaultValue: '') required this.provider, @JsonKey(name: 'accessToken', defaultValue: '') required this.token, @JsonKey(name: 'refreshToken', defaultValue: '') required this.refreshToken}): super._();
  factory _AuthDataResponse.fromJson(Map<String, dynamic> json) => _$AuthDataResponseFromJson(json);

@override@JsonKey(name: 'id', defaultValue: '') final  String userId;
@override@JsonKey(name: 'role', defaultValue: '') final  String role;
@override@JsonKey(name: 'email', defaultValue: '') final  String email;
@override@JsonKey(name: 'provider', defaultValue: '') final  String provider;
@override@JsonKey(name: 'accessToken', defaultValue: '') final  String token;
@override@JsonKey(name: 'refreshToken', defaultValue: '') final  String refreshToken;

/// Create a copy of AuthDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDataResponseCopyWith<_AuthDataResponse> get copyWith => __$AuthDataResponseCopyWithImpl<_AuthDataResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthDataResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDataResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.email, email) || other.email == email)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,role,email,provider,token,refreshToken);

@override
String toString() {
  return 'AuthDataResponse(userId: $userId, role: $role, email: $email, provider: $provider, token: $token, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$AuthDataResponseCopyWith<$Res> implements $AuthDataResponseCopyWith<$Res> {
  factory _$AuthDataResponseCopyWith(_AuthDataResponse value, $Res Function(_AuthDataResponse) _then) = __$AuthDataResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: '') String userId,@JsonKey(name: 'role', defaultValue: '') String role,@JsonKey(name: 'email', defaultValue: '') String email,@JsonKey(name: 'provider', defaultValue: '') String provider,@JsonKey(name: 'accessToken', defaultValue: '') String token,@JsonKey(name: 'refreshToken', defaultValue: '') String refreshToken
});




}
/// @nodoc
class __$AuthDataResponseCopyWithImpl<$Res>
    implements _$AuthDataResponseCopyWith<$Res> {
  __$AuthDataResponseCopyWithImpl(this._self, this._then);

  final _AuthDataResponse _self;
  final $Res Function(_AuthDataResponse) _then;

/// Create a copy of AuthDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? role = null,Object? email = null,Object? provider = null,Object? token = null,Object? refreshToken = null,}) {
  return _then(_AuthDataResponse(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
