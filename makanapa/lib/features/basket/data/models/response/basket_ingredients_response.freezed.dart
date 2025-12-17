// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_ingredients_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasketIngredientsResponse {

@JsonKey(name: 'veg', defaultValue: []) List<BasketItemResponse> get vegetables;@JsonKey(name: 'mea', defaultValue: []) List<BasketItemResponse> get meats;@JsonKey(name: 'oth', defaultValue: []) List<BasketItemResponse> get others;
/// Create a copy of BasketIngredientsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketIngredientsResponseCopyWith<BasketIngredientsResponse> get copyWith => _$BasketIngredientsResponseCopyWithImpl<BasketIngredientsResponse>(this as BasketIngredientsResponse, _$identity);

  /// Serializes this BasketIngredientsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketIngredientsResponse&&const DeepCollectionEquality().equals(other.vegetables, vegetables)&&const DeepCollectionEquality().equals(other.meats, meats)&&const DeepCollectionEquality().equals(other.others, others));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(vegetables),const DeepCollectionEquality().hash(meats),const DeepCollectionEquality().hash(others));

@override
String toString() {
  return 'BasketIngredientsResponse(vegetables: $vegetables, meats: $meats, others: $others)';
}


}

/// @nodoc
abstract mixin class $BasketIngredientsResponseCopyWith<$Res>  {
  factory $BasketIngredientsResponseCopyWith(BasketIngredientsResponse value, $Res Function(BasketIngredientsResponse) _then) = _$BasketIngredientsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'veg', defaultValue: []) List<BasketItemResponse> vegetables,@JsonKey(name: 'mea', defaultValue: []) List<BasketItemResponse> meats,@JsonKey(name: 'oth', defaultValue: []) List<BasketItemResponse> others
});




}
/// @nodoc
class _$BasketIngredientsResponseCopyWithImpl<$Res>
    implements $BasketIngredientsResponseCopyWith<$Res> {
  _$BasketIngredientsResponseCopyWithImpl(this._self, this._then);

  final BasketIngredientsResponse _self;
  final $Res Function(BasketIngredientsResponse) _then;

/// Create a copy of BasketIngredientsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vegetables = null,Object? meats = null,Object? others = null,}) {
  return _then(_self.copyWith(
vegetables: null == vegetables ? _self.vegetables : vegetables // ignore: cast_nullable_to_non_nullable
as List<BasketItemResponse>,meats: null == meats ? _self.meats : meats // ignore: cast_nullable_to_non_nullable
as List<BasketItemResponse>,others: null == others ? _self.others : others // ignore: cast_nullable_to_non_nullable
as List<BasketItemResponse>,
  ));
}

}


/// Adds pattern-matching-related methods to [BasketIngredientsResponse].
extension BasketIngredientsResponsePatterns on BasketIngredientsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketIngredientsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketIngredientsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketIngredientsResponse value)  $default,){
final _that = this;
switch (_that) {
case _BasketIngredientsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketIngredientsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BasketIngredientsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'veg', defaultValue: [])  List<BasketItemResponse> vegetables, @JsonKey(name: 'mea', defaultValue: [])  List<BasketItemResponse> meats, @JsonKey(name: 'oth', defaultValue: [])  List<BasketItemResponse> others)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasketIngredientsResponse() when $default != null:
return $default(_that.vegetables,_that.meats,_that.others);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'veg', defaultValue: [])  List<BasketItemResponse> vegetables, @JsonKey(name: 'mea', defaultValue: [])  List<BasketItemResponse> meats, @JsonKey(name: 'oth', defaultValue: [])  List<BasketItemResponse> others)  $default,) {final _that = this;
switch (_that) {
case _BasketIngredientsResponse():
return $default(_that.vegetables,_that.meats,_that.others);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'veg', defaultValue: [])  List<BasketItemResponse> vegetables, @JsonKey(name: 'mea', defaultValue: [])  List<BasketItemResponse> meats, @JsonKey(name: 'oth', defaultValue: [])  List<BasketItemResponse> others)?  $default,) {final _that = this;
switch (_that) {
case _BasketIngredientsResponse() when $default != null:
return $default(_that.vegetables,_that.meats,_that.others);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasketIngredientsResponse implements BasketIngredientsResponse {
  const _BasketIngredientsResponse({@JsonKey(name: 'veg', defaultValue: []) required final  List<BasketItemResponse> vegetables, @JsonKey(name: 'mea', defaultValue: []) required final  List<BasketItemResponse> meats, @JsonKey(name: 'oth', defaultValue: []) required final  List<BasketItemResponse> others}): _vegetables = vegetables,_meats = meats,_others = others;
  factory _BasketIngredientsResponse.fromJson(Map<String, dynamic> json) => _$BasketIngredientsResponseFromJson(json);

 final  List<BasketItemResponse> _vegetables;
@override@JsonKey(name: 'veg', defaultValue: []) List<BasketItemResponse> get vegetables {
  if (_vegetables is EqualUnmodifiableListView) return _vegetables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vegetables);
}

 final  List<BasketItemResponse> _meats;
@override@JsonKey(name: 'mea', defaultValue: []) List<BasketItemResponse> get meats {
  if (_meats is EqualUnmodifiableListView) return _meats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meats);
}

 final  List<BasketItemResponse> _others;
@override@JsonKey(name: 'oth', defaultValue: []) List<BasketItemResponse> get others {
  if (_others is EqualUnmodifiableListView) return _others;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_others);
}


/// Create a copy of BasketIngredientsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketIngredientsResponseCopyWith<_BasketIngredientsResponse> get copyWith => __$BasketIngredientsResponseCopyWithImpl<_BasketIngredientsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasketIngredientsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketIngredientsResponse&&const DeepCollectionEquality().equals(other._vegetables, _vegetables)&&const DeepCollectionEquality().equals(other._meats, _meats)&&const DeepCollectionEquality().equals(other._others, _others));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_vegetables),const DeepCollectionEquality().hash(_meats),const DeepCollectionEquality().hash(_others));

@override
String toString() {
  return 'BasketIngredientsResponse(vegetables: $vegetables, meats: $meats, others: $others)';
}


}

/// @nodoc
abstract mixin class _$BasketIngredientsResponseCopyWith<$Res> implements $BasketIngredientsResponseCopyWith<$Res> {
  factory _$BasketIngredientsResponseCopyWith(_BasketIngredientsResponse value, $Res Function(_BasketIngredientsResponse) _then) = __$BasketIngredientsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'veg', defaultValue: []) List<BasketItemResponse> vegetables,@JsonKey(name: 'mea', defaultValue: []) List<BasketItemResponse> meats,@JsonKey(name: 'oth', defaultValue: []) List<BasketItemResponse> others
});




}
/// @nodoc
class __$BasketIngredientsResponseCopyWithImpl<$Res>
    implements _$BasketIngredientsResponseCopyWith<$Res> {
  __$BasketIngredientsResponseCopyWithImpl(this._self, this._then);

  final _BasketIngredientsResponse _self;
  final $Res Function(_BasketIngredientsResponse) _then;

/// Create a copy of BasketIngredientsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vegetables = null,Object? meats = null,Object? others = null,}) {
  return _then(_BasketIngredientsResponse(
vegetables: null == vegetables ? _self._vegetables : vegetables // ignore: cast_nullable_to_non_nullable
as List<BasketItemResponse>,meats: null == meats ? _self._meats : meats // ignore: cast_nullable_to_non_nullable
as List<BasketItemResponse>,others: null == others ? _self._others : others // ignore: cast_nullable_to_non_nullable
as List<BasketItemResponse>,
  ));
}


}

// dart format on
