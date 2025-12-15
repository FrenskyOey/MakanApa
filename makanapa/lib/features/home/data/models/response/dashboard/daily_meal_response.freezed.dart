// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_meal_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyMealResponse {

@JsonKey(name: 'date', defaultValue: "") String get date;@JsonKey(name: 'lunch', defaultValue: null) RecipeResponse? get lunch;@JsonKey(name: 'dinner', defaultValue: null) RecipeResponse? get dinner;
/// Create a copy of DailyMealResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyMealResponseCopyWith<DailyMealResponse> get copyWith => _$DailyMealResponseCopyWithImpl<DailyMealResponse>(this as DailyMealResponse, _$identity);

  /// Serializes this DailyMealResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyMealResponse&&(identical(other.date, date) || other.date == date)&&(identical(other.lunch, lunch) || other.lunch == lunch)&&(identical(other.dinner, dinner) || other.dinner == dinner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,lunch,dinner);

@override
String toString() {
  return 'DailyMealResponse(date: $date, lunch: $lunch, dinner: $dinner)';
}


}

/// @nodoc
abstract mixin class $DailyMealResponseCopyWith<$Res>  {
  factory $DailyMealResponseCopyWith(DailyMealResponse value, $Res Function(DailyMealResponse) _then) = _$DailyMealResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'date', defaultValue: "") String date,@JsonKey(name: 'lunch', defaultValue: null) RecipeResponse? lunch,@JsonKey(name: 'dinner', defaultValue: null) RecipeResponse? dinner
});


$RecipeResponseCopyWith<$Res>? get lunch;$RecipeResponseCopyWith<$Res>? get dinner;

}
/// @nodoc
class _$DailyMealResponseCopyWithImpl<$Res>
    implements $DailyMealResponseCopyWith<$Res> {
  _$DailyMealResponseCopyWithImpl(this._self, this._then);

  final DailyMealResponse _self;
  final $Res Function(DailyMealResponse) _then;

/// Create a copy of DailyMealResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? lunch = freezed,Object? dinner = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,lunch: freezed == lunch ? _self.lunch : lunch // ignore: cast_nullable_to_non_nullable
as RecipeResponse?,dinner: freezed == dinner ? _self.dinner : dinner // ignore: cast_nullable_to_non_nullable
as RecipeResponse?,
  ));
}
/// Create a copy of DailyMealResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeResponseCopyWith<$Res>? get lunch {
    if (_self.lunch == null) {
    return null;
  }

  return $RecipeResponseCopyWith<$Res>(_self.lunch!, (value) {
    return _then(_self.copyWith(lunch: value));
  });
}/// Create a copy of DailyMealResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeResponseCopyWith<$Res>? get dinner {
    if (_self.dinner == null) {
    return null;
  }

  return $RecipeResponseCopyWith<$Res>(_self.dinner!, (value) {
    return _then(_self.copyWith(dinner: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyMealResponse].
extension DailyMealResponsePatterns on DailyMealResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyMealResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyMealResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyMealResponse value)  $default,){
final _that = this;
switch (_that) {
case _DailyMealResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyMealResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DailyMealResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'date', defaultValue: "")  String date, @JsonKey(name: 'lunch', defaultValue: null)  RecipeResponse? lunch, @JsonKey(name: 'dinner', defaultValue: null)  RecipeResponse? dinner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyMealResponse() when $default != null:
return $default(_that.date,_that.lunch,_that.dinner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'date', defaultValue: "")  String date, @JsonKey(name: 'lunch', defaultValue: null)  RecipeResponse? lunch, @JsonKey(name: 'dinner', defaultValue: null)  RecipeResponse? dinner)  $default,) {final _that = this;
switch (_that) {
case _DailyMealResponse():
return $default(_that.date,_that.lunch,_that.dinner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'date', defaultValue: "")  String date, @JsonKey(name: 'lunch', defaultValue: null)  RecipeResponse? lunch, @JsonKey(name: 'dinner', defaultValue: null)  RecipeResponse? dinner)?  $default,) {final _that = this;
switch (_that) {
case _DailyMealResponse() when $default != null:
return $default(_that.date,_that.lunch,_that.dinner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyMealResponse extends DailyMealResponse {
  const _DailyMealResponse({@JsonKey(name: 'date', defaultValue: "") required this.date, @JsonKey(name: 'lunch', defaultValue: null) this.lunch, @JsonKey(name: 'dinner', defaultValue: null) this.dinner}): super._();
  factory _DailyMealResponse.fromJson(Map<String, dynamic> json) => _$DailyMealResponseFromJson(json);

@override@JsonKey(name: 'date', defaultValue: "") final  String date;
@override@JsonKey(name: 'lunch', defaultValue: null) final  RecipeResponse? lunch;
@override@JsonKey(name: 'dinner', defaultValue: null) final  RecipeResponse? dinner;

/// Create a copy of DailyMealResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyMealResponseCopyWith<_DailyMealResponse> get copyWith => __$DailyMealResponseCopyWithImpl<_DailyMealResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyMealResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyMealResponse&&(identical(other.date, date) || other.date == date)&&(identical(other.lunch, lunch) || other.lunch == lunch)&&(identical(other.dinner, dinner) || other.dinner == dinner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,lunch,dinner);

@override
String toString() {
  return 'DailyMealResponse(date: $date, lunch: $lunch, dinner: $dinner)';
}


}

/// @nodoc
abstract mixin class _$DailyMealResponseCopyWith<$Res> implements $DailyMealResponseCopyWith<$Res> {
  factory _$DailyMealResponseCopyWith(_DailyMealResponse value, $Res Function(_DailyMealResponse) _then) = __$DailyMealResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'date', defaultValue: "") String date,@JsonKey(name: 'lunch', defaultValue: null) RecipeResponse? lunch,@JsonKey(name: 'dinner', defaultValue: null) RecipeResponse? dinner
});


@override $RecipeResponseCopyWith<$Res>? get lunch;@override $RecipeResponseCopyWith<$Res>? get dinner;

}
/// @nodoc
class __$DailyMealResponseCopyWithImpl<$Res>
    implements _$DailyMealResponseCopyWith<$Res> {
  __$DailyMealResponseCopyWithImpl(this._self, this._then);

  final _DailyMealResponse _self;
  final $Res Function(_DailyMealResponse) _then;

/// Create a copy of DailyMealResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? lunch = freezed,Object? dinner = freezed,}) {
  return _then(_DailyMealResponse(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,lunch: freezed == lunch ? _self.lunch : lunch // ignore: cast_nullable_to_non_nullable
as RecipeResponse?,dinner: freezed == dinner ? _self.dinner : dinner // ignore: cast_nullable_to_non_nullable
as RecipeResponse?,
  ));
}

/// Create a copy of DailyMealResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeResponseCopyWith<$Res>? get lunch {
    if (_self.lunch == null) {
    return null;
  }

  return $RecipeResponseCopyWith<$Res>(_self.lunch!, (value) {
    return _then(_self.copyWith(lunch: value));
  });
}/// Create a copy of DailyMealResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeResponseCopyWith<$Res>? get dinner {
    if (_self.dinner == null) {
    return null;
  }

  return $RecipeResponseCopyWith<$Res>(_self.dinner!, (value) {
    return _then(_self.copyWith(dinner: value));
  });
}
}

// dart format on
