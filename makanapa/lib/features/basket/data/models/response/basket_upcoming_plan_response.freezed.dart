// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_upcoming_plan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasketUpcomingPlanResponse {

@JsonKey(name: 'group_id') int get groupId;@JsonKey(name: 'start_date') String get startDate;
/// Create a copy of BasketUpcomingPlanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketUpcomingPlanResponseCopyWith<BasketUpcomingPlanResponse> get copyWith => _$BasketUpcomingPlanResponseCopyWithImpl<BasketUpcomingPlanResponse>(this as BasketUpcomingPlanResponse, _$identity);

  /// Serializes this BasketUpcomingPlanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketUpcomingPlanResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,startDate);

@override
String toString() {
  return 'BasketUpcomingPlanResponse(groupId: $groupId, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class $BasketUpcomingPlanResponseCopyWith<$Res>  {
  factory $BasketUpcomingPlanResponseCopyWith(BasketUpcomingPlanResponse value, $Res Function(BasketUpcomingPlanResponse) _then) = _$BasketUpcomingPlanResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'start_date') String startDate
});




}
/// @nodoc
class _$BasketUpcomingPlanResponseCopyWithImpl<$Res>
    implements $BasketUpcomingPlanResponseCopyWith<$Res> {
  _$BasketUpcomingPlanResponseCopyWithImpl(this._self, this._then);

  final BasketUpcomingPlanResponse _self;
  final $Res Function(BasketUpcomingPlanResponse) _then;

/// Create a copy of BasketUpcomingPlanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? startDate = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BasketUpcomingPlanResponse].
extension BasketUpcomingPlanResponsePatterns on BasketUpcomingPlanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketUpcomingPlanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketUpcomingPlanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketUpcomingPlanResponse value)  $default,){
final _that = this;
switch (_that) {
case _BasketUpcomingPlanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketUpcomingPlanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BasketUpcomingPlanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasketUpcomingPlanResponse() when $default != null:
return $default(_that.groupId,_that.startDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate)  $default,) {final _that = this;
switch (_that) {
case _BasketUpcomingPlanResponse():
return $default(_that.groupId,_that.startDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate)?  $default,) {final _that = this;
switch (_that) {
case _BasketUpcomingPlanResponse() when $default != null:
return $default(_that.groupId,_that.startDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasketUpcomingPlanResponse extends BasketUpcomingPlanResponse {
  const _BasketUpcomingPlanResponse({@JsonKey(name: 'group_id') required this.groupId, @JsonKey(name: 'start_date') required this.startDate}): super._();
  factory _BasketUpcomingPlanResponse.fromJson(Map<String, dynamic> json) => _$BasketUpcomingPlanResponseFromJson(json);

@override@JsonKey(name: 'group_id') final  int groupId;
@override@JsonKey(name: 'start_date') final  String startDate;

/// Create a copy of BasketUpcomingPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketUpcomingPlanResponseCopyWith<_BasketUpcomingPlanResponse> get copyWith => __$BasketUpcomingPlanResponseCopyWithImpl<_BasketUpcomingPlanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasketUpcomingPlanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketUpcomingPlanResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,startDate);

@override
String toString() {
  return 'BasketUpcomingPlanResponse(groupId: $groupId, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class _$BasketUpcomingPlanResponseCopyWith<$Res> implements $BasketUpcomingPlanResponseCopyWith<$Res> {
  factory _$BasketUpcomingPlanResponseCopyWith(_BasketUpcomingPlanResponse value, $Res Function(_BasketUpcomingPlanResponse) _then) = __$BasketUpcomingPlanResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'start_date') String startDate
});




}
/// @nodoc
class __$BasketUpcomingPlanResponseCopyWithImpl<$Res>
    implements _$BasketUpcomingPlanResponseCopyWith<$Res> {
  __$BasketUpcomingPlanResponseCopyWithImpl(this._self, this._then);

  final _BasketUpcomingPlanResponse _self;
  final $Res Function(_BasketUpcomingPlanResponse) _then;

/// Create a copy of BasketUpcomingPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? startDate = null,}) {
  return _then(_BasketUpcomingPlanResponse(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
