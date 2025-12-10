// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_plan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePlanResponse {

@JsonKey(name: 'group_id') int get groupId;@JsonKey(name: 'message') String get message;
/// Create a copy of CreatePlanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePlanResponseCopyWith<CreatePlanResponse> get copyWith => _$CreatePlanResponseCopyWithImpl<CreatePlanResponse>(this as CreatePlanResponse, _$identity);

  /// Serializes this CreatePlanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePlanResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,message);

@override
String toString() {
  return 'CreatePlanResponse(groupId: $groupId, message: $message)';
}


}

/// @nodoc
abstract mixin class $CreatePlanResponseCopyWith<$Res>  {
  factory $CreatePlanResponseCopyWith(CreatePlanResponse value, $Res Function(CreatePlanResponse) _then) = _$CreatePlanResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'message') String message
});




}
/// @nodoc
class _$CreatePlanResponseCopyWithImpl<$Res>
    implements $CreatePlanResponseCopyWith<$Res> {
  _$CreatePlanResponseCopyWithImpl(this._self, this._then);

  final CreatePlanResponse _self;
  final $Res Function(CreatePlanResponse) _then;

/// Create a copy of CreatePlanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? message = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePlanResponse].
extension CreatePlanResponsePatterns on CreatePlanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePlanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePlanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePlanResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreatePlanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePlanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePlanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'message')  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePlanResponse() when $default != null:
return $default(_that.groupId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'message')  String message)  $default,) {final _that = this;
switch (_that) {
case _CreatePlanResponse():
return $default(_that.groupId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'message')  String message)?  $default,) {final _that = this;
switch (_that) {
case _CreatePlanResponse() when $default != null:
return $default(_that.groupId,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePlanResponse implements CreatePlanResponse {
  const _CreatePlanResponse({@JsonKey(name: 'group_id') required this.groupId, @JsonKey(name: 'message') required this.message});
  factory _CreatePlanResponse.fromJson(Map<String, dynamic> json) => _$CreatePlanResponseFromJson(json);

@override@JsonKey(name: 'group_id') final  int groupId;
@override@JsonKey(name: 'message') final  String message;

/// Create a copy of CreatePlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePlanResponseCopyWith<_CreatePlanResponse> get copyWith => __$CreatePlanResponseCopyWithImpl<_CreatePlanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePlanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePlanResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,message);

@override
String toString() {
  return 'CreatePlanResponse(groupId: $groupId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CreatePlanResponseCopyWith<$Res> implements $CreatePlanResponseCopyWith<$Res> {
  factory _$CreatePlanResponseCopyWith(_CreatePlanResponse value, $Res Function(_CreatePlanResponse) _then) = __$CreatePlanResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'message') String message
});




}
/// @nodoc
class __$CreatePlanResponseCopyWithImpl<$Res>
    implements _$CreatePlanResponseCopyWith<$Res> {
  __$CreatePlanResponseCopyWithImpl(this._self, this._then);

  final _CreatePlanResponse _self;
  final $Res Function(_CreatePlanResponse) _then;

/// Create a copy of CreatePlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? message = null,}) {
  return _then(_CreatePlanResponse(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
