// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasketItemResponse {

@JsonKey(name: 'id', defaultValue: 0) int get id;@JsonKey(name: 'name', defaultValue: '') String get name;@JsonKey(name: 'unit', defaultValue: '') String get unit;@JsonKey(name: 'quantity', defaultValue: 0) num get quantity;
/// Create a copy of BasketItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketItemResponseCopyWith<BasketItemResponse> get copyWith => _$BasketItemResponseCopyWithImpl<BasketItemResponse>(this as BasketItemResponse, _$identity);

  /// Serializes this BasketItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,unit,quantity);

@override
String toString() {
  return 'BasketItemResponse(id: $id, name: $name, unit: $unit, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $BasketItemResponseCopyWith<$Res>  {
  factory $BasketItemResponseCopyWith(BasketItemResponse value, $Res Function(BasketItemResponse) _then) = _$BasketItemResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: 0) int id,@JsonKey(name: 'name', defaultValue: '') String name,@JsonKey(name: 'unit', defaultValue: '') String unit,@JsonKey(name: 'quantity', defaultValue: 0) num quantity
});




}
/// @nodoc
class _$BasketItemResponseCopyWithImpl<$Res>
    implements $BasketItemResponseCopyWith<$Res> {
  _$BasketItemResponseCopyWithImpl(this._self, this._then);

  final BasketItemResponse _self;
  final $Res Function(BasketItemResponse) _then;

/// Create a copy of BasketItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? unit = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [BasketItemResponse].
extension BasketItemResponsePatterns on BasketItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _BasketItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BasketItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'unit', defaultValue: '')  String unit, @JsonKey(name: 'quantity', defaultValue: 0)  num quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasketItemResponse() when $default != null:
return $default(_that.id,_that.name,_that.unit,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'unit', defaultValue: '')  String unit, @JsonKey(name: 'quantity', defaultValue: 0)  num quantity)  $default,) {final _that = this;
switch (_that) {
case _BasketItemResponse():
return $default(_that.id,_that.name,_that.unit,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'unit', defaultValue: '')  String unit, @JsonKey(name: 'quantity', defaultValue: 0)  num quantity)?  $default,) {final _that = this;
switch (_that) {
case _BasketItemResponse() when $default != null:
return $default(_that.id,_that.name,_that.unit,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasketItemResponse extends BasketItemResponse {
  const _BasketItemResponse({@JsonKey(name: 'id', defaultValue: 0) required this.id, @JsonKey(name: 'name', defaultValue: '') required this.name, @JsonKey(name: 'unit', defaultValue: '') required this.unit, @JsonKey(name: 'quantity', defaultValue: 0) required this.quantity}): super._();
  factory _BasketItemResponse.fromJson(Map<String, dynamic> json) => _$BasketItemResponseFromJson(json);

@override@JsonKey(name: 'id', defaultValue: 0) final  int id;
@override@JsonKey(name: 'name', defaultValue: '') final  String name;
@override@JsonKey(name: 'unit', defaultValue: '') final  String unit;
@override@JsonKey(name: 'quantity', defaultValue: 0) final  num quantity;

/// Create a copy of BasketItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketItemResponseCopyWith<_BasketItemResponse> get copyWith => __$BasketItemResponseCopyWithImpl<_BasketItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasketItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketItemResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,unit,quantity);

@override
String toString() {
  return 'BasketItemResponse(id: $id, name: $name, unit: $unit, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$BasketItemResponseCopyWith<$Res> implements $BasketItemResponseCopyWith<$Res> {
  factory _$BasketItemResponseCopyWith(_BasketItemResponse value, $Res Function(_BasketItemResponse) _then) = __$BasketItemResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: 0) int id,@JsonKey(name: 'name', defaultValue: '') String name,@JsonKey(name: 'unit', defaultValue: '') String unit,@JsonKey(name: 'quantity', defaultValue: 0) num quantity
});




}
/// @nodoc
class __$BasketItemResponseCopyWithImpl<$Res>
    implements _$BasketItemResponseCopyWith<$Res> {
  __$BasketItemResponseCopyWithImpl(this._self, this._then);

  final _BasketItemResponse _self;
  final $Res Function(_BasketItemResponse) _then;

/// Create a copy of BasketItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? unit = null,Object? quantity = null,}) {
  return _then(_BasketItemResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
