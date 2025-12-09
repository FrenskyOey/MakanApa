// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_plan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeeklyPlanResponse {

@JsonKey(name: 'group_id') int get groupId;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'meal_plan', defaultValue: []) List<DailyMealResponse> get mealPlan;
/// Create a copy of WeeklyPlanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyPlanResponseCopyWith<WeeklyPlanResponse> get copyWith => _$WeeklyPlanResponseCopyWithImpl<WeeklyPlanResponse>(this as WeeklyPlanResponse, _$identity);

  /// Serializes this WeeklyPlanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyPlanResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.mealPlan, mealPlan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,startDate,endDate,const DeepCollectionEquality().hash(mealPlan));

@override
String toString() {
  return 'WeeklyPlanResponse(groupId: $groupId, startDate: $startDate, endDate: $endDate, mealPlan: $mealPlan)';
}


}

/// @nodoc
abstract mixin class $WeeklyPlanResponseCopyWith<$Res>  {
  factory $WeeklyPlanResponseCopyWith(WeeklyPlanResponse value, $Res Function(WeeklyPlanResponse) _then) = _$WeeklyPlanResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'meal_plan', defaultValue: []) List<DailyMealResponse> mealPlan
});




}
/// @nodoc
class _$WeeklyPlanResponseCopyWithImpl<$Res>
    implements $WeeklyPlanResponseCopyWith<$Res> {
  _$WeeklyPlanResponseCopyWithImpl(this._self, this._then);

  final WeeklyPlanResponse _self;
  final $Res Function(WeeklyPlanResponse) _then;

/// Create a copy of WeeklyPlanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? startDate = null,Object? endDate = null,Object? mealPlan = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,mealPlan: null == mealPlan ? _self.mealPlan : mealPlan // ignore: cast_nullable_to_non_nullable
as List<DailyMealResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyPlanResponse].
extension WeeklyPlanResponsePatterns on WeeklyPlanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyPlanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyPlanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyPlanResponse value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyPlanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyPlanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyPlanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'meal_plan', defaultValue: [])  List<DailyMealResponse> mealPlan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyPlanResponse() when $default != null:
return $default(_that.groupId,_that.startDate,_that.endDate,_that.mealPlan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'meal_plan', defaultValue: [])  List<DailyMealResponse> mealPlan)  $default,) {final _that = this;
switch (_that) {
case _WeeklyPlanResponse():
return $default(_that.groupId,_that.startDate,_that.endDate,_that.mealPlan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'meal_plan', defaultValue: [])  List<DailyMealResponse> mealPlan)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyPlanResponse() when $default != null:
return $default(_that.groupId,_that.startDate,_that.endDate,_that.mealPlan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeeklyPlanResponse implements WeeklyPlanResponse {
  const _WeeklyPlanResponse({@JsonKey(name: 'group_id') required this.groupId, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'meal_plan', defaultValue: []) required final  List<DailyMealResponse> mealPlan}): _mealPlan = mealPlan;
  factory _WeeklyPlanResponse.fromJson(Map<String, dynamic> json) => _$WeeklyPlanResponseFromJson(json);

@override@JsonKey(name: 'group_id') final  int groupId;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
 final  List<DailyMealResponse> _mealPlan;
@override@JsonKey(name: 'meal_plan', defaultValue: []) List<DailyMealResponse> get mealPlan {
  if (_mealPlan is EqualUnmodifiableListView) return _mealPlan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mealPlan);
}


/// Create a copy of WeeklyPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyPlanResponseCopyWith<_WeeklyPlanResponse> get copyWith => __$WeeklyPlanResponseCopyWithImpl<_WeeklyPlanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeeklyPlanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyPlanResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._mealPlan, _mealPlan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,startDate,endDate,const DeepCollectionEquality().hash(_mealPlan));

@override
String toString() {
  return 'WeeklyPlanResponse(groupId: $groupId, startDate: $startDate, endDate: $endDate, mealPlan: $mealPlan)';
}


}

/// @nodoc
abstract mixin class _$WeeklyPlanResponseCopyWith<$Res> implements $WeeklyPlanResponseCopyWith<$Res> {
  factory _$WeeklyPlanResponseCopyWith(_WeeklyPlanResponse value, $Res Function(_WeeklyPlanResponse) _then) = __$WeeklyPlanResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'meal_plan', defaultValue: []) List<DailyMealResponse> mealPlan
});




}
/// @nodoc
class __$WeeklyPlanResponseCopyWithImpl<$Res>
    implements _$WeeklyPlanResponseCopyWith<$Res> {
  __$WeeklyPlanResponseCopyWithImpl(this._self, this._then);

  final _WeeklyPlanResponse _self;
  final $Res Function(_WeeklyPlanResponse) _then;

/// Create a copy of WeeklyPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? startDate = null,Object? endDate = null,Object? mealPlan = null,}) {
  return _then(_WeeklyPlanResponse(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,mealPlan: null == mealPlan ? _self._mealPlan : mealPlan // ignore: cast_nullable_to_non_nullable
as List<DailyMealResponse>,
  ));
}


}

// dart format on
