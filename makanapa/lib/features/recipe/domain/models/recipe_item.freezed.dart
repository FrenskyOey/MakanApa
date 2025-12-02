// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeItem {

 int get id; String get name; String get enName; String get picture; DishEnum get dishType; ClassEnum get classType; String get urlLinks;
/// Create a copy of RecipeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeItemCopyWith<RecipeItem> get copyWith => _$RecipeItemCopyWithImpl<RecipeItem>(this as RecipeItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.enName, enName) || other.enName == enName)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.dishType, dishType) || other.dishType == dishType)&&(identical(other.classType, classType) || other.classType == classType)&&(identical(other.urlLinks, urlLinks) || other.urlLinks == urlLinks));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,enName,picture,dishType,classType,urlLinks);

@override
String toString() {
  return 'RecipeItem(id: $id, name: $name, enName: $enName, picture: $picture, dishType: $dishType, classType: $classType, urlLinks: $urlLinks)';
}


}

/// @nodoc
abstract mixin class $RecipeItemCopyWith<$Res>  {
  factory $RecipeItemCopyWith(RecipeItem value, $Res Function(RecipeItem) _then) = _$RecipeItemCopyWithImpl;
@useResult
$Res call({
 int id, String name, String enName, String picture, DishEnum dishType, ClassEnum classType, String urlLinks
});




}
/// @nodoc
class _$RecipeItemCopyWithImpl<$Res>
    implements $RecipeItemCopyWith<$Res> {
  _$RecipeItemCopyWithImpl(this._self, this._then);

  final RecipeItem _self;
  final $Res Function(RecipeItem) _then;

/// Create a copy of RecipeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? enName = null,Object? picture = null,Object? dishType = null,Object? classType = null,Object? urlLinks = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,enName: null == enName ? _self.enName : enName // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,dishType: null == dishType ? _self.dishType : dishType // ignore: cast_nullable_to_non_nullable
as DishEnum,classType: null == classType ? _self.classType : classType // ignore: cast_nullable_to_non_nullable
as ClassEnum,urlLinks: null == urlLinks ? _self.urlLinks : urlLinks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeItem].
extension RecipeItemPatterns on RecipeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeItem value)  $default,){
final _that = this;
switch (_that) {
case _RecipeItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeItem value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String enName,  String picture,  DishEnum dishType,  ClassEnum classType,  String urlLinks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeItem() when $default != null:
return $default(_that.id,_that.name,_that.enName,_that.picture,_that.dishType,_that.classType,_that.urlLinks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String enName,  String picture,  DishEnum dishType,  ClassEnum classType,  String urlLinks)  $default,) {final _that = this;
switch (_that) {
case _RecipeItem():
return $default(_that.id,_that.name,_that.enName,_that.picture,_that.dishType,_that.classType,_that.urlLinks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String enName,  String picture,  DishEnum dishType,  ClassEnum classType,  String urlLinks)?  $default,) {final _that = this;
switch (_that) {
case _RecipeItem() when $default != null:
return $default(_that.id,_that.name,_that.enName,_that.picture,_that.dishType,_that.classType,_that.urlLinks);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeItem implements RecipeItem {
  const _RecipeItem({this.id = 0, this.name = "", this.enName = "", this.picture = "", this.dishType = DishEnum.main, this.classType = ClassEnum.lainnya, this.urlLinks = ""});
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String enName;
@override@JsonKey() final  String picture;
@override@JsonKey() final  DishEnum dishType;
@override@JsonKey() final  ClassEnum classType;
@override@JsonKey() final  String urlLinks;

/// Create a copy of RecipeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeItemCopyWith<_RecipeItem> get copyWith => __$RecipeItemCopyWithImpl<_RecipeItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.enName, enName) || other.enName == enName)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.dishType, dishType) || other.dishType == dishType)&&(identical(other.classType, classType) || other.classType == classType)&&(identical(other.urlLinks, urlLinks) || other.urlLinks == urlLinks));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,enName,picture,dishType,classType,urlLinks);

@override
String toString() {
  return 'RecipeItem(id: $id, name: $name, enName: $enName, picture: $picture, dishType: $dishType, classType: $classType, urlLinks: $urlLinks)';
}


}

/// @nodoc
abstract mixin class _$RecipeItemCopyWith<$Res> implements $RecipeItemCopyWith<$Res> {
  factory _$RecipeItemCopyWith(_RecipeItem value, $Res Function(_RecipeItem) _then) = __$RecipeItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String enName, String picture, DishEnum dishType, ClassEnum classType, String urlLinks
});




}
/// @nodoc
class __$RecipeItemCopyWithImpl<$Res>
    implements _$RecipeItemCopyWith<$Res> {
  __$RecipeItemCopyWithImpl(this._self, this._then);

  final _RecipeItem _self;
  final $Res Function(_RecipeItem) _then;

/// Create a copy of RecipeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? enName = null,Object? picture = null,Object? dishType = null,Object? classType = null,Object? urlLinks = null,}) {
  return _then(_RecipeItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,enName: null == enName ? _self.enName : enName // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,dishType: null == dishType ? _self.dishType : dishType // ignore: cast_nullable_to_non_nullable
as DishEnum,classType: null == classType ? _self.classType : classType // ignore: cast_nullable_to_non_nullable
as ClassEnum,urlLinks: null == urlLinks ? _self.urlLinks : urlLinks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
