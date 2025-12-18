// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_dashboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasketDashboardResponse {

@JsonKey(name: 'current_week_ingredients') BasketSummaryResponse? get currentWeekIngredients;@JsonKey(name: 'upcoming_plan', defaultValue: []) List<BasketUpcomingPlanResponse> get upcomingPlans;
/// Create a copy of BasketDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketDashboardResponseCopyWith<BasketDashboardResponse> get copyWith => _$BasketDashboardResponseCopyWithImpl<BasketDashboardResponse>(this as BasketDashboardResponse, _$identity);

  /// Serializes this BasketDashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketDashboardResponse&&(identical(other.currentWeekIngredients, currentWeekIngredients) || other.currentWeekIngredients == currentWeekIngredients)&&const DeepCollectionEquality().equals(other.upcomingPlans, upcomingPlans));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentWeekIngredients,const DeepCollectionEquality().hash(upcomingPlans));

@override
String toString() {
  return 'BasketDashboardResponse(currentWeekIngredients: $currentWeekIngredients, upcomingPlans: $upcomingPlans)';
}


}

/// @nodoc
abstract mixin class $BasketDashboardResponseCopyWith<$Res>  {
  factory $BasketDashboardResponseCopyWith(BasketDashboardResponse value, $Res Function(BasketDashboardResponse) _then) = _$BasketDashboardResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_week_ingredients') BasketSummaryResponse? currentWeekIngredients,@JsonKey(name: 'upcoming_plan', defaultValue: []) List<BasketUpcomingPlanResponse> upcomingPlans
});


$BasketSummaryResponseCopyWith<$Res>? get currentWeekIngredients;

}
/// @nodoc
class _$BasketDashboardResponseCopyWithImpl<$Res>
    implements $BasketDashboardResponseCopyWith<$Res> {
  _$BasketDashboardResponseCopyWithImpl(this._self, this._then);

  final BasketDashboardResponse _self;
  final $Res Function(BasketDashboardResponse) _then;

/// Create a copy of BasketDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentWeekIngredients = freezed,Object? upcomingPlans = null,}) {
  return _then(_self.copyWith(
currentWeekIngredients: freezed == currentWeekIngredients ? _self.currentWeekIngredients : currentWeekIngredients // ignore: cast_nullable_to_non_nullable
as BasketSummaryResponse?,upcomingPlans: null == upcomingPlans ? _self.upcomingPlans : upcomingPlans // ignore: cast_nullable_to_non_nullable
as List<BasketUpcomingPlanResponse>,
  ));
}
/// Create a copy of BasketDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasketSummaryResponseCopyWith<$Res>? get currentWeekIngredients {
    if (_self.currentWeekIngredients == null) {
    return null;
  }

  return $BasketSummaryResponseCopyWith<$Res>(_self.currentWeekIngredients!, (value) {
    return _then(_self.copyWith(currentWeekIngredients: value));
  });
}
}


/// Adds pattern-matching-related methods to [BasketDashboardResponse].
extension BasketDashboardResponsePatterns on BasketDashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketDashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketDashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _BasketDashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketDashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BasketDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_week_ingredients')  BasketSummaryResponse? currentWeekIngredients, @JsonKey(name: 'upcoming_plan', defaultValue: [])  List<BasketUpcomingPlanResponse> upcomingPlans)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasketDashboardResponse() when $default != null:
return $default(_that.currentWeekIngredients,_that.upcomingPlans);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_week_ingredients')  BasketSummaryResponse? currentWeekIngredients, @JsonKey(name: 'upcoming_plan', defaultValue: [])  List<BasketUpcomingPlanResponse> upcomingPlans)  $default,) {final _that = this;
switch (_that) {
case _BasketDashboardResponse():
return $default(_that.currentWeekIngredients,_that.upcomingPlans);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_week_ingredients')  BasketSummaryResponse? currentWeekIngredients, @JsonKey(name: 'upcoming_plan', defaultValue: [])  List<BasketUpcomingPlanResponse> upcomingPlans)?  $default,) {final _that = this;
switch (_that) {
case _BasketDashboardResponse() when $default != null:
return $default(_that.currentWeekIngredients,_that.upcomingPlans);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasketDashboardResponse extends BasketDashboardResponse {
  const _BasketDashboardResponse({@JsonKey(name: 'current_week_ingredients') this.currentWeekIngredients, @JsonKey(name: 'upcoming_plan', defaultValue: []) required final  List<BasketUpcomingPlanResponse> upcomingPlans}): _upcomingPlans = upcomingPlans,super._();
  factory _BasketDashboardResponse.fromJson(Map<String, dynamic> json) => _$BasketDashboardResponseFromJson(json);

@override@JsonKey(name: 'current_week_ingredients') final  BasketSummaryResponse? currentWeekIngredients;
 final  List<BasketUpcomingPlanResponse> _upcomingPlans;
@override@JsonKey(name: 'upcoming_plan', defaultValue: []) List<BasketUpcomingPlanResponse> get upcomingPlans {
  if (_upcomingPlans is EqualUnmodifiableListView) return _upcomingPlans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingPlans);
}


/// Create a copy of BasketDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketDashboardResponseCopyWith<_BasketDashboardResponse> get copyWith => __$BasketDashboardResponseCopyWithImpl<_BasketDashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasketDashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketDashboardResponse&&(identical(other.currentWeekIngredients, currentWeekIngredients) || other.currentWeekIngredients == currentWeekIngredients)&&const DeepCollectionEquality().equals(other._upcomingPlans, _upcomingPlans));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentWeekIngredients,const DeepCollectionEquality().hash(_upcomingPlans));

@override
String toString() {
  return 'BasketDashboardResponse(currentWeekIngredients: $currentWeekIngredients, upcomingPlans: $upcomingPlans)';
}


}

/// @nodoc
abstract mixin class _$BasketDashboardResponseCopyWith<$Res> implements $BasketDashboardResponseCopyWith<$Res> {
  factory _$BasketDashboardResponseCopyWith(_BasketDashboardResponse value, $Res Function(_BasketDashboardResponse) _then) = __$BasketDashboardResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_week_ingredients') BasketSummaryResponse? currentWeekIngredients,@JsonKey(name: 'upcoming_plan', defaultValue: []) List<BasketUpcomingPlanResponse> upcomingPlans
});


@override $BasketSummaryResponseCopyWith<$Res>? get currentWeekIngredients;

}
/// @nodoc
class __$BasketDashboardResponseCopyWithImpl<$Res>
    implements _$BasketDashboardResponseCopyWith<$Res> {
  __$BasketDashboardResponseCopyWithImpl(this._self, this._then);

  final _BasketDashboardResponse _self;
  final $Res Function(_BasketDashboardResponse) _then;

/// Create a copy of BasketDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentWeekIngredients = freezed,Object? upcomingPlans = null,}) {
  return _then(_BasketDashboardResponse(
currentWeekIngredients: freezed == currentWeekIngredients ? _self.currentWeekIngredients : currentWeekIngredients // ignore: cast_nullable_to_non_nullable
as BasketSummaryResponse?,upcomingPlans: null == upcomingPlans ? _self._upcomingPlans : upcomingPlans // ignore: cast_nullable_to_non_nullable
as List<BasketUpcomingPlanResponse>,
  ));
}

/// Create a copy of BasketDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasketSummaryResponseCopyWith<$Res>? get currentWeekIngredients {
    if (_self.currentWeekIngredients == null) {
    return null;
  }

  return $BasketSummaryResponseCopyWith<$Res>(_self.currentWeekIngredients!, (value) {
    return _then(_self.copyWith(currentWeekIngredients: value));
  });
}
}

// dart format on
