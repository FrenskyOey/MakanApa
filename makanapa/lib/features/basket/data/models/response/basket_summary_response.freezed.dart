// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasketSummaryResponse {

@JsonKey(name: 'group_id') int get groupId;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'bahan') BasketIngredientsResponse get ingredients;
/// Create a copy of BasketSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketSummaryResponseCopyWith<BasketSummaryResponse> get copyWith => _$BasketSummaryResponseCopyWithImpl<BasketSummaryResponse>(this as BasketSummaryResponse, _$identity);

  /// Serializes this BasketSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketSummaryResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.ingredients, ingredients) || other.ingredients == ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,startDate,ingredients);

@override
String toString() {
  return 'BasketSummaryResponse(groupId: $groupId, startDate: $startDate, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $BasketSummaryResponseCopyWith<$Res>  {
  factory $BasketSummaryResponseCopyWith(BasketSummaryResponse value, $Res Function(BasketSummaryResponse) _then) = _$BasketSummaryResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'bahan') BasketIngredientsResponse ingredients
});


$BasketIngredientsResponseCopyWith<$Res> get ingredients;

}
/// @nodoc
class _$BasketSummaryResponseCopyWithImpl<$Res>
    implements $BasketSummaryResponseCopyWith<$Res> {
  _$BasketSummaryResponseCopyWithImpl(this._self, this._then);

  final BasketSummaryResponse _self;
  final $Res Function(BasketSummaryResponse) _then;

/// Create a copy of BasketSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? startDate = null,Object? ingredients = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as BasketIngredientsResponse,
  ));
}
/// Create a copy of BasketSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasketIngredientsResponseCopyWith<$Res> get ingredients {
  
  return $BasketIngredientsResponseCopyWith<$Res>(_self.ingredients, (value) {
    return _then(_self.copyWith(ingredients: value));
  });
}
}


/// Adds pattern-matching-related methods to [BasketSummaryResponse].
extension BasketSummaryResponsePatterns on BasketSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _BasketSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BasketSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'bahan')  BasketIngredientsResponse ingredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasketSummaryResponse() when $default != null:
return $default(_that.groupId,_that.startDate,_that.ingredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'bahan')  BasketIngredientsResponse ingredients)  $default,) {final _that = this;
switch (_that) {
case _BasketSummaryResponse():
return $default(_that.groupId,_that.startDate,_that.ingredients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'group_id')  int groupId, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'bahan')  BasketIngredientsResponse ingredients)?  $default,) {final _that = this;
switch (_that) {
case _BasketSummaryResponse() when $default != null:
return $default(_that.groupId,_that.startDate,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasketSummaryResponse extends BasketSummaryResponse {
  const _BasketSummaryResponse({@JsonKey(name: 'group_id') required this.groupId, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'bahan') required this.ingredients}): super._();
  factory _BasketSummaryResponse.fromJson(Map<String, dynamic> json) => _$BasketSummaryResponseFromJson(json);

@override@JsonKey(name: 'group_id') final  int groupId;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'bahan') final  BasketIngredientsResponse ingredients;

/// Create a copy of BasketSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketSummaryResponseCopyWith<_BasketSummaryResponse> get copyWith => __$BasketSummaryResponseCopyWithImpl<_BasketSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasketSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketSummaryResponse&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.ingredients, ingredients) || other.ingredients == ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,startDate,ingredients);

@override
String toString() {
  return 'BasketSummaryResponse(groupId: $groupId, startDate: $startDate, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$BasketSummaryResponseCopyWith<$Res> implements $BasketSummaryResponseCopyWith<$Res> {
  factory _$BasketSummaryResponseCopyWith(_BasketSummaryResponse value, $Res Function(_BasketSummaryResponse) _then) = __$BasketSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'group_id') int groupId,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'bahan') BasketIngredientsResponse ingredients
});


@override $BasketIngredientsResponseCopyWith<$Res> get ingredients;

}
/// @nodoc
class __$BasketSummaryResponseCopyWithImpl<$Res>
    implements _$BasketSummaryResponseCopyWith<$Res> {
  __$BasketSummaryResponseCopyWithImpl(this._self, this._then);

  final _BasketSummaryResponse _self;
  final $Res Function(_BasketSummaryResponse) _then;

/// Create a copy of BasketSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? startDate = null,Object? ingredients = null,}) {
  return _then(_BasketSummaryResponse(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as BasketIngredientsResponse,
  ));
}

/// Create a copy of BasketSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BasketIngredientsResponseCopyWith<$Res> get ingredients {
  
  return $BasketIngredientsResponseCopyWith<$Res>(_self.ingredients, (value) {
    return _then(_self.copyWith(ingredients: value));
  });
}
}

// dart format on
