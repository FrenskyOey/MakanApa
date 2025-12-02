// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientsResponse {

@JsonKey(name: 'id', defaultValue: 0) int get id;@JsonKey(name: 'name', defaultValue: '') String get name;@JsonKey(name: 'bahantype', defaultValue: '') String get types;@JsonKey(name: 'unittype', defaultValue: '') String get unitType;@JsonKey(name: 'qty', defaultValue: 0) int get quantity;
/// Create a copy of IngredientsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientsResponseCopyWith<IngredientsResponse> get copyWith => _$IngredientsResponseCopyWithImpl<IngredientsResponse>(this as IngredientsResponse, _$identity);

  /// Serializes this IngredientsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientsResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.types, types) || other.types == types)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,types,unitType,quantity);

@override
String toString() {
  return 'IngredientsResponse(id: $id, name: $name, types: $types, unitType: $unitType, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $IngredientsResponseCopyWith<$Res>  {
  factory $IngredientsResponseCopyWith(IngredientsResponse value, $Res Function(IngredientsResponse) _then) = _$IngredientsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: 0) int id,@JsonKey(name: 'name', defaultValue: '') String name,@JsonKey(name: 'bahantype', defaultValue: '') String types,@JsonKey(name: 'unittype', defaultValue: '') String unitType,@JsonKey(name: 'qty', defaultValue: 0) int quantity
});




}
/// @nodoc
class _$IngredientsResponseCopyWithImpl<$Res>
    implements $IngredientsResponseCopyWith<$Res> {
  _$IngredientsResponseCopyWithImpl(this._self, this._then);

  final IngredientsResponse _self;
  final $Res Function(IngredientsResponse) _then;

/// Create a copy of IngredientsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? types = null,Object? unitType = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as String,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientsResponse].
extension IngredientsResponsePatterns on IngredientsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientsResponse value)  $default,){
final _that = this;
switch (_that) {
case _IngredientsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'bahantype', defaultValue: '')  String types, @JsonKey(name: 'unittype', defaultValue: '')  String unitType, @JsonKey(name: 'qty', defaultValue: 0)  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientsResponse() when $default != null:
return $default(_that.id,_that.name,_that.types,_that.unitType,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'bahantype', defaultValue: '')  String types, @JsonKey(name: 'unittype', defaultValue: '')  String unitType, @JsonKey(name: 'qty', defaultValue: 0)  int quantity)  $default,) {final _that = this;
switch (_that) {
case _IngredientsResponse():
return $default(_that.id,_that.name,_that.types,_that.unitType,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'bahantype', defaultValue: '')  String types, @JsonKey(name: 'unittype', defaultValue: '')  String unitType, @JsonKey(name: 'qty', defaultValue: 0)  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _IngredientsResponse() when $default != null:
return $default(_that.id,_that.name,_that.types,_that.unitType,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IngredientsResponse extends IngredientsResponse {
  const _IngredientsResponse({@JsonKey(name: 'id', defaultValue: 0) required this.id, @JsonKey(name: 'name', defaultValue: '') required this.name, @JsonKey(name: 'bahantype', defaultValue: '') required this.types, @JsonKey(name: 'unittype', defaultValue: '') required this.unitType, @JsonKey(name: 'qty', defaultValue: 0) required this.quantity}): super._();
  factory _IngredientsResponse.fromJson(Map<String, dynamic> json) => _$IngredientsResponseFromJson(json);

@override@JsonKey(name: 'id', defaultValue: 0) final  int id;
@override@JsonKey(name: 'name', defaultValue: '') final  String name;
@override@JsonKey(name: 'bahantype', defaultValue: '') final  String types;
@override@JsonKey(name: 'unittype', defaultValue: '') final  String unitType;
@override@JsonKey(name: 'qty', defaultValue: 0) final  int quantity;

/// Create a copy of IngredientsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientsResponseCopyWith<_IngredientsResponse> get copyWith => __$IngredientsResponseCopyWithImpl<_IngredientsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientsResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.types, types) || other.types == types)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,types,unitType,quantity);

@override
String toString() {
  return 'IngredientsResponse(id: $id, name: $name, types: $types, unitType: $unitType, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$IngredientsResponseCopyWith<$Res> implements $IngredientsResponseCopyWith<$Res> {
  factory _$IngredientsResponseCopyWith(_IngredientsResponse value, $Res Function(_IngredientsResponse) _then) = __$IngredientsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: 0) int id,@JsonKey(name: 'name', defaultValue: '') String name,@JsonKey(name: 'bahantype', defaultValue: '') String types,@JsonKey(name: 'unittype', defaultValue: '') String unitType,@JsonKey(name: 'qty', defaultValue: 0) int quantity
});




}
/// @nodoc
class __$IngredientsResponseCopyWithImpl<$Res>
    implements _$IngredientsResponseCopyWith<$Res> {
  __$IngredientsResponseCopyWithImpl(this._self, this._then);

  final _IngredientsResponse _self;
  final $Res Function(_IngredientsResponse) _then;

/// Create a copy of IngredientsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? types = null,Object? unitType = null,Object? quantity = null,}) {
  return _then(_IngredientsResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as String,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
