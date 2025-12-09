// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardResponse {

@JsonKey(name: 'current_week_plant') WeeklyPlanResponse? get currentWeekPlan;@JsonKey(name: 'upcoming_plan', defaultValue: []) List<UpcomingPlanResponse> get upcomingPlans;@JsonKey(name: 'avaible_plan', defaultValue: []) List<AvailablePlanResponse> get availablePlans;
/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardResponseCopyWith<DashboardResponse> get copyWith => _$DashboardResponseCopyWithImpl<DashboardResponse>(this as DashboardResponse, _$identity);

  /// Serializes this DashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardResponse&&(identical(other.currentWeekPlan, currentWeekPlan) || other.currentWeekPlan == currentWeekPlan)&&const DeepCollectionEquality().equals(other.upcomingPlans, upcomingPlans)&&const DeepCollectionEquality().equals(other.availablePlans, availablePlans));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentWeekPlan,const DeepCollectionEquality().hash(upcomingPlans),const DeepCollectionEquality().hash(availablePlans));

@override
String toString() {
  return 'DashboardResponse(currentWeekPlan: $currentWeekPlan, upcomingPlans: $upcomingPlans, availablePlans: $availablePlans)';
}


}

/// @nodoc
abstract mixin class $DashboardResponseCopyWith<$Res>  {
  factory $DashboardResponseCopyWith(DashboardResponse value, $Res Function(DashboardResponse) _then) = _$DashboardResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_week_plant') WeeklyPlanResponse? currentWeekPlan,@JsonKey(name: 'upcoming_plan', defaultValue: []) List<UpcomingPlanResponse> upcomingPlans,@JsonKey(name: 'avaible_plan', defaultValue: []) List<AvailablePlanResponse> availablePlans
});


$WeeklyPlanResponseCopyWith<$Res>? get currentWeekPlan;

}
/// @nodoc
class _$DashboardResponseCopyWithImpl<$Res>
    implements $DashboardResponseCopyWith<$Res> {
  _$DashboardResponseCopyWithImpl(this._self, this._then);

  final DashboardResponse _self;
  final $Res Function(DashboardResponse) _then;

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentWeekPlan = freezed,Object? upcomingPlans = null,Object? availablePlans = null,}) {
  return _then(_self.copyWith(
currentWeekPlan: freezed == currentWeekPlan ? _self.currentWeekPlan : currentWeekPlan // ignore: cast_nullable_to_non_nullable
as WeeklyPlanResponse?,upcomingPlans: null == upcomingPlans ? _self.upcomingPlans : upcomingPlans // ignore: cast_nullable_to_non_nullable
as List<UpcomingPlanResponse>,availablePlans: null == availablePlans ? _self.availablePlans : availablePlans // ignore: cast_nullable_to_non_nullable
as List<AvailablePlanResponse>,
  ));
}
/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklyPlanResponseCopyWith<$Res>? get currentWeekPlan {
    if (_self.currentWeekPlan == null) {
    return null;
  }

  return $WeeklyPlanResponseCopyWith<$Res>(_self.currentWeekPlan!, (value) {
    return _then(_self.copyWith(currentWeekPlan: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardResponse].
extension DashboardResponsePatterns on DashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _DashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_week_plant')  WeeklyPlanResponse? currentWeekPlan, @JsonKey(name: 'upcoming_plan', defaultValue: [])  List<UpcomingPlanResponse> upcomingPlans, @JsonKey(name: 'avaible_plan', defaultValue: [])  List<AvailablePlanResponse> availablePlans)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
return $default(_that.currentWeekPlan,_that.upcomingPlans,_that.availablePlans);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_week_plant')  WeeklyPlanResponse? currentWeekPlan, @JsonKey(name: 'upcoming_plan', defaultValue: [])  List<UpcomingPlanResponse> upcomingPlans, @JsonKey(name: 'avaible_plan', defaultValue: [])  List<AvailablePlanResponse> availablePlans)  $default,) {final _that = this;
switch (_that) {
case _DashboardResponse():
return $default(_that.currentWeekPlan,_that.upcomingPlans,_that.availablePlans);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_week_plant')  WeeklyPlanResponse? currentWeekPlan, @JsonKey(name: 'upcoming_plan', defaultValue: [])  List<UpcomingPlanResponse> upcomingPlans, @JsonKey(name: 'avaible_plan', defaultValue: [])  List<AvailablePlanResponse> availablePlans)?  $default,) {final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
return $default(_that.currentWeekPlan,_that.upcomingPlans,_that.availablePlans);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardResponse extends DashboardResponse {
  const _DashboardResponse({@JsonKey(name: 'current_week_plant') this.currentWeekPlan, @JsonKey(name: 'upcoming_plan', defaultValue: []) required final  List<UpcomingPlanResponse> upcomingPlans, @JsonKey(name: 'avaible_plan', defaultValue: []) required final  List<AvailablePlanResponse> availablePlans}): _upcomingPlans = upcomingPlans,_availablePlans = availablePlans,super._();
  factory _DashboardResponse.fromJson(Map<String, dynamic> json) => _$DashboardResponseFromJson(json);

@override@JsonKey(name: 'current_week_plant') final  WeeklyPlanResponse? currentWeekPlan;
 final  List<UpcomingPlanResponse> _upcomingPlans;
@override@JsonKey(name: 'upcoming_plan', defaultValue: []) List<UpcomingPlanResponse> get upcomingPlans {
  if (_upcomingPlans is EqualUnmodifiableListView) return _upcomingPlans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingPlans);
}

 final  List<AvailablePlanResponse> _availablePlans;
@override@JsonKey(name: 'avaible_plan', defaultValue: []) List<AvailablePlanResponse> get availablePlans {
  if (_availablePlans is EqualUnmodifiableListView) return _availablePlans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availablePlans);
}


/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardResponseCopyWith<_DashboardResponse> get copyWith => __$DashboardResponseCopyWithImpl<_DashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardResponse&&(identical(other.currentWeekPlan, currentWeekPlan) || other.currentWeekPlan == currentWeekPlan)&&const DeepCollectionEquality().equals(other._upcomingPlans, _upcomingPlans)&&const DeepCollectionEquality().equals(other._availablePlans, _availablePlans));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentWeekPlan,const DeepCollectionEquality().hash(_upcomingPlans),const DeepCollectionEquality().hash(_availablePlans));

@override
String toString() {
  return 'DashboardResponse(currentWeekPlan: $currentWeekPlan, upcomingPlans: $upcomingPlans, availablePlans: $availablePlans)';
}


}

/// @nodoc
abstract mixin class _$DashboardResponseCopyWith<$Res> implements $DashboardResponseCopyWith<$Res> {
  factory _$DashboardResponseCopyWith(_DashboardResponse value, $Res Function(_DashboardResponse) _then) = __$DashboardResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_week_plant') WeeklyPlanResponse? currentWeekPlan,@JsonKey(name: 'upcoming_plan', defaultValue: []) List<UpcomingPlanResponse> upcomingPlans,@JsonKey(name: 'avaible_plan', defaultValue: []) List<AvailablePlanResponse> availablePlans
});


@override $WeeklyPlanResponseCopyWith<$Res>? get currentWeekPlan;

}
/// @nodoc
class __$DashboardResponseCopyWithImpl<$Res>
    implements _$DashboardResponseCopyWith<$Res> {
  __$DashboardResponseCopyWithImpl(this._self, this._then);

  final _DashboardResponse _self;
  final $Res Function(_DashboardResponse) _then;

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentWeekPlan = freezed,Object? upcomingPlans = null,Object? availablePlans = null,}) {
  return _then(_DashboardResponse(
currentWeekPlan: freezed == currentWeekPlan ? _self.currentWeekPlan : currentWeekPlan // ignore: cast_nullable_to_non_nullable
as WeeklyPlanResponse?,upcomingPlans: null == upcomingPlans ? _self._upcomingPlans : upcomingPlans // ignore: cast_nullable_to_non_nullable
as List<UpcomingPlanResponse>,availablePlans: null == availablePlans ? _self._availablePlans : availablePlans // ignore: cast_nullable_to_non_nullable
as List<AvailablePlanResponse>,
  ));
}

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklyPlanResponseCopyWith<$Res>? get currentWeekPlan {
    if (_self.currentWeekPlan == null) {
    return null;
  }

  return $WeeklyPlanResponseCopyWith<$Res>(_self.currentWeekPlan!, (value) {
    return _then(_self.copyWith(currentWeekPlan: value));
  });
}
}


/// @nodoc
mixin _$UpcomingPlanResponse {

@JsonKey(name: 'group_id') int get groupId;@JsonKey(name: 'start_date') String get startDate;
/// Create a copy of UpcomingPlanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpcomingPlanResponseCopyWith<UpcomingPlanResponse> get copyWith => _$UpcomingPlanResponseCopyWithImpl<UpcomingPlanResponse>(this as UpcomingPlanResponse, _$identity);

  /// Serializes this UpcomingPlanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpcomingPlanResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,startDate);

@override
String toString() {
  return 'UpcomingPlanResponse(groupId: $groupId, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class $UpcomingPlanResponseCopyWith<$Res>  {
  factory $UpcomingPlanResponseCopyWith(UpcomingPlanResponse value, $Res Function(UpcomingPlanResponse) _then) = _$UpcomingPlanResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'start_date') String startDate
});




}
/// @nodoc
class _$UpcomingPlanResponseCopyWithImpl<$Res>
    implements $UpcomingPlanResponseCopyWith<$Res> {
  _$UpcomingPlanResponseCopyWithImpl(this._self, this._then);

  final UpcomingPlanResponse _self;
  final $Res Function(UpcomingPlanResponse) _then;

/// Create a copy of UpcomingPlanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? startDate = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpcomingPlanResponse].
extension UpcomingPlanResponsePatterns on UpcomingPlanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpcomingPlanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpcomingPlanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpcomingPlanResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpcomingPlanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpcomingPlanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpcomingPlanResponse() when $default != null:
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
case _UpcomingPlanResponse() when $default != null:
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
case _UpcomingPlanResponse():
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
case _UpcomingPlanResponse() when $default != null:
return $default(_that.groupId,_that.startDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpcomingPlanResponse extends UpcomingPlanResponse {
  const _UpcomingPlanResponse({@JsonKey(name: 'group_id') required this.groupId, @JsonKey(name: 'start_date') required this.startDate}): super._();
  factory _UpcomingPlanResponse.fromJson(Map<String, dynamic> json) => _$UpcomingPlanResponseFromJson(json);

@override@JsonKey(name: 'group_id') final  int groupId;
@override@JsonKey(name: 'start_date') final  String startDate;

/// Create a copy of UpcomingPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpcomingPlanResponseCopyWith<_UpcomingPlanResponse> get copyWith => __$UpcomingPlanResponseCopyWithImpl<_UpcomingPlanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpcomingPlanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpcomingPlanResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,startDate);

@override
String toString() {
  return 'UpcomingPlanResponse(groupId: $groupId, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class _$UpcomingPlanResponseCopyWith<$Res> implements $UpcomingPlanResponseCopyWith<$Res> {
  factory _$UpcomingPlanResponseCopyWith(_UpcomingPlanResponse value, $Res Function(_UpcomingPlanResponse) _then) = __$UpcomingPlanResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'start_date') String startDate
});




}
/// @nodoc
class __$UpcomingPlanResponseCopyWithImpl<$Res>
    implements _$UpcomingPlanResponseCopyWith<$Res> {
  __$UpcomingPlanResponseCopyWithImpl(this._self, this._then);

  final _UpcomingPlanResponse _self;
  final $Res Function(_UpcomingPlanResponse) _then;

/// Create a copy of UpcomingPlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? startDate = null,}) {
  return _then(_UpcomingPlanResponse(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AvailablePlanResponse {

@JsonKey(name: 'start_date') String get startDate;
/// Create a copy of AvailablePlanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailablePlanResponseCopyWith<AvailablePlanResponse> get copyWith => _$AvailablePlanResponseCopyWithImpl<AvailablePlanResponse>(this as AvailablePlanResponse, _$identity);

  /// Serializes this AvailablePlanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailablePlanResponse&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate);

@override
String toString() {
  return 'AvailablePlanResponse(startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class $AvailablePlanResponseCopyWith<$Res>  {
  factory $AvailablePlanResponseCopyWith(AvailablePlanResponse value, $Res Function(AvailablePlanResponse) _then) = _$AvailablePlanResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'start_date') String startDate
});




}
/// @nodoc
class _$AvailablePlanResponseCopyWithImpl<$Res>
    implements $AvailablePlanResponseCopyWith<$Res> {
  _$AvailablePlanResponseCopyWithImpl(this._self, this._then);

  final AvailablePlanResponse _self;
  final $Res Function(AvailablePlanResponse) _then;

/// Create a copy of AvailablePlanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,}) {
  return _then(_self.copyWith(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailablePlanResponse].
extension AvailablePlanResponsePatterns on AvailablePlanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailablePlanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailablePlanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailablePlanResponse value)  $default,){
final _that = this;
switch (_that) {
case _AvailablePlanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailablePlanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AvailablePlanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  String startDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailablePlanResponse() when $default != null:
return $default(_that.startDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'start_date')  String startDate)  $default,) {final _that = this;
switch (_that) {
case _AvailablePlanResponse():
return $default(_that.startDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'start_date')  String startDate)?  $default,) {final _that = this;
switch (_that) {
case _AvailablePlanResponse() when $default != null:
return $default(_that.startDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailablePlanResponse extends AvailablePlanResponse {
  const _AvailablePlanResponse({@JsonKey(name: 'start_date') required this.startDate}): super._();
  factory _AvailablePlanResponse.fromJson(Map<String, dynamic> json) => _$AvailablePlanResponseFromJson(json);

@override@JsonKey(name: 'start_date') final  String startDate;

/// Create a copy of AvailablePlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailablePlanResponseCopyWith<_AvailablePlanResponse> get copyWith => __$AvailablePlanResponseCopyWithImpl<_AvailablePlanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailablePlanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailablePlanResponse&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate);

@override
String toString() {
  return 'AvailablePlanResponse(startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class _$AvailablePlanResponseCopyWith<$Res> implements $AvailablePlanResponseCopyWith<$Res> {
  factory _$AvailablePlanResponseCopyWith(_AvailablePlanResponse value, $Res Function(_AvailablePlanResponse) _then) = __$AvailablePlanResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'start_date') String startDate
});




}
/// @nodoc
class __$AvailablePlanResponseCopyWithImpl<$Res>
    implements _$AvailablePlanResponseCopyWith<$Res> {
  __$AvailablePlanResponseCopyWithImpl(this._self, this._then);

  final _AvailablePlanResponse _self;
  final $Res Function(_AvailablePlanResponse) _then;

/// Create a copy of AvailablePlanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,}) {
  return _then(_AvailablePlanResponse(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
