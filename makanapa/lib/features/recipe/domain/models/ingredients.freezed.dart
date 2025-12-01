// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Ingredients {

 int get id; String get name; IngredientEnum get type; String get unit; int get qty;
/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientsCopyWith<Ingredients> get copyWith => _$IngredientsCopyWithImpl<Ingredients>(this as Ingredients, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredients&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.qty, qty) || other.qty == qty));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,unit,qty);

@override
String toString() {
  return 'Ingredients(id: $id, name: $name, type: $type, unit: $unit, qty: $qty)';
}


}

/// @nodoc
abstract mixin class $IngredientsCopyWith<$Res>  {
  factory $IngredientsCopyWith(Ingredients value, $Res Function(Ingredients) _then) = _$IngredientsCopyWithImpl;
@useResult
$Res call({
 int id, String name, IngredientEnum type, String unit, int qty
});




}
/// @nodoc
class _$IngredientsCopyWithImpl<$Res>
    implements $IngredientsCopyWith<$Res> {
  _$IngredientsCopyWithImpl(this._self, this._then);

  final Ingredients _self;
  final $Res Function(Ingredients) _then;

/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? unit = null,Object? qty = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IngredientEnum,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Ingredients].
extension IngredientsPatterns on Ingredients {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ingredients value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ingredients() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ingredients value)  $default,){
final _that = this;
switch (_that) {
case _Ingredients():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ingredients value)?  $default,){
final _that = this;
switch (_that) {
case _Ingredients() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  IngredientEnum type,  String unit,  int qty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ingredients() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.unit,_that.qty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  IngredientEnum type,  String unit,  int qty)  $default,) {final _that = this;
switch (_that) {
case _Ingredients():
return $default(_that.id,_that.name,_that.type,_that.unit,_that.qty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  IngredientEnum type,  String unit,  int qty)?  $default,) {final _that = this;
switch (_that) {
case _Ingredients() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.unit,_that.qty);case _:
  return null;

}
}

}

/// @nodoc


class _Ingredients implements Ingredients {
  const _Ingredients({this.id = 0, this.name = "", this.type = IngredientEnum.other, this.unit = "", this.qty = 0});
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  IngredientEnum type;
@override@JsonKey() final  String unit;
@override@JsonKey() final  int qty;

/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientsCopyWith<_Ingredients> get copyWith => __$IngredientsCopyWithImpl<_Ingredients>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredients&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.qty, qty) || other.qty == qty));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,unit,qty);

@override
String toString() {
  return 'Ingredients(id: $id, name: $name, type: $type, unit: $unit, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$IngredientsCopyWith<$Res> implements $IngredientsCopyWith<$Res> {
  factory _$IngredientsCopyWith(_Ingredients value, $Res Function(_Ingredients) _then) = __$IngredientsCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, IngredientEnum type, String unit, int qty
});




}
/// @nodoc
class __$IngredientsCopyWithImpl<$Res>
    implements _$IngredientsCopyWith<$Res> {
  __$IngredientsCopyWithImpl(this._self, this._then);

  final _Ingredients _self;
  final $Res Function(_Ingredients) _then;

/// Create a copy of Ingredients
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? unit = null,Object? qty = null,}) {
  return _then(_Ingredients(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IngredientEnum,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
