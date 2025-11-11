// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDataResponse {

@JsonKey(name: 'uid', defaultValue: '') String get userId;@JsonKey(name: 'user_name', defaultValue: '') String get name;@JsonKey(name: 'email', defaultValue: '') String get email;@JsonKey(name: 'phone_number', defaultValue: '') String get phone;@JsonKey(name: 'avatar', defaultValue: '') String get avatar;@JsonKey(name: 'salt_code', defaultValue: '') String get salts;
/// Create a copy of UserDataResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataResponseCopyWith<UserDataResponse> get copyWith => _$UserDataResponseCopyWithImpl<UserDataResponse>(this as UserDataResponse, _$identity);

  /// Serializes this UserDataResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDataResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.salts, salts) || other.salts == salts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,email,phone,avatar,salts);

@override
String toString() {
  return 'UserDataResponse(userId: $userId, name: $name, email: $email, phone: $phone, avatar: $avatar, salts: $salts)';
}


}

/// @nodoc
abstract mixin class $UserDataResponseCopyWith<$Res>  {
  factory $UserDataResponseCopyWith(UserDataResponse value, $Res Function(UserDataResponse) _then) = _$UserDataResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'uid', defaultValue: '') String userId,@JsonKey(name: 'user_name', defaultValue: '') String name,@JsonKey(name: 'email', defaultValue: '') String email,@JsonKey(name: 'phone_number', defaultValue: '') String phone,@JsonKey(name: 'avatar', defaultValue: '') String avatar,@JsonKey(name: 'salt_code', defaultValue: '') String salts
});




}
/// @nodoc
class _$UserDataResponseCopyWithImpl<$Res>
    implements $UserDataResponseCopyWith<$Res> {
  _$UserDataResponseCopyWithImpl(this._self, this._then);

  final UserDataResponse _self;
  final $Res Function(UserDataResponse) _then;

/// Create a copy of UserDataResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? avatar = null,Object? salts = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,salts: null == salts ? _self.salts : salts // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDataResponse].
extension UserDataResponsePatterns on UserDataResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDataResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDataResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDataResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserDataResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDataResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserDataResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'uid', defaultValue: '')  String userId, @JsonKey(name: 'user_name', defaultValue: '')  String name, @JsonKey(name: 'email', defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phone, @JsonKey(name: 'avatar', defaultValue: '')  String avatar, @JsonKey(name: 'salt_code', defaultValue: '')  String salts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDataResponse() when $default != null:
return $default(_that.userId,_that.name,_that.email,_that.phone,_that.avatar,_that.salts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'uid', defaultValue: '')  String userId, @JsonKey(name: 'user_name', defaultValue: '')  String name, @JsonKey(name: 'email', defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phone, @JsonKey(name: 'avatar', defaultValue: '')  String avatar, @JsonKey(name: 'salt_code', defaultValue: '')  String salts)  $default,) {final _that = this;
switch (_that) {
case _UserDataResponse():
return $default(_that.userId,_that.name,_that.email,_that.phone,_that.avatar,_that.salts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'uid', defaultValue: '')  String userId, @JsonKey(name: 'user_name', defaultValue: '')  String name, @JsonKey(name: 'email', defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phone, @JsonKey(name: 'avatar', defaultValue: '')  String avatar, @JsonKey(name: 'salt_code', defaultValue: '')  String salts)?  $default,) {final _that = this;
switch (_that) {
case _UserDataResponse() when $default != null:
return $default(_that.userId,_that.name,_that.email,_that.phone,_that.avatar,_that.salts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDataResponse extends UserDataResponse {
  const _UserDataResponse({@JsonKey(name: 'uid', defaultValue: '') required this.userId, @JsonKey(name: 'user_name', defaultValue: '') required this.name, @JsonKey(name: 'email', defaultValue: '') required this.email, @JsonKey(name: 'phone_number', defaultValue: '') required this.phone, @JsonKey(name: 'avatar', defaultValue: '') required this.avatar, @JsonKey(name: 'salt_code', defaultValue: '') required this.salts}): super._();
  factory _UserDataResponse.fromJson(Map<String, dynamic> json) => _$UserDataResponseFromJson(json);

@override@JsonKey(name: 'uid', defaultValue: '') final  String userId;
@override@JsonKey(name: 'user_name', defaultValue: '') final  String name;
@override@JsonKey(name: 'email', defaultValue: '') final  String email;
@override@JsonKey(name: 'phone_number', defaultValue: '') final  String phone;
@override@JsonKey(name: 'avatar', defaultValue: '') final  String avatar;
@override@JsonKey(name: 'salt_code', defaultValue: '') final  String salts;

/// Create a copy of UserDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataResponseCopyWith<_UserDataResponse> get copyWith => __$UserDataResponseCopyWithImpl<_UserDataResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDataResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.salts, salts) || other.salts == salts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,email,phone,avatar,salts);

@override
String toString() {
  return 'UserDataResponse(userId: $userId, name: $name, email: $email, phone: $phone, avatar: $avatar, salts: $salts)';
}


}

/// @nodoc
abstract mixin class _$UserDataResponseCopyWith<$Res> implements $UserDataResponseCopyWith<$Res> {
  factory _$UserDataResponseCopyWith(_UserDataResponse value, $Res Function(_UserDataResponse) _then) = __$UserDataResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'uid', defaultValue: '') String userId,@JsonKey(name: 'user_name', defaultValue: '') String name,@JsonKey(name: 'email', defaultValue: '') String email,@JsonKey(name: 'phone_number', defaultValue: '') String phone,@JsonKey(name: 'avatar', defaultValue: '') String avatar,@JsonKey(name: 'salt_code', defaultValue: '') String salts
});




}
/// @nodoc
class __$UserDataResponseCopyWithImpl<$Res>
    implements _$UserDataResponseCopyWith<$Res> {
  __$UserDataResponseCopyWithImpl(this._self, this._then);

  final _UserDataResponse _self;
  final $Res Function(_UserDataResponse) _then;

/// Create a copy of UserDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? avatar = null,Object? salts = null,}) {
  return _then(_UserDataResponse(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,salts: null == salts ? _self.salts : salts // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
