// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeResponse {

@JsonKey(name: 'id', defaultValue: 0) int get id;@JsonKey(name: 'name', defaultValue: '') String get name;@JsonKey(name: 'en_name', defaultValue: '') String get enName;@JsonKey(name: 'reseptype', defaultValue: '') String get resepType;@JsonKey(name: 'classtype', defaultValue: '') String get classType;@JsonKey(name: 'picture', defaultValue: '') String get picture;@JsonKey(name: 'is_bookmarked', defaultValue: false) bool get isBookmark;
/// Create a copy of RecipeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeResponseCopyWith<RecipeResponse> get copyWith => _$RecipeResponseCopyWithImpl<RecipeResponse>(this as RecipeResponse, _$identity);

  /// Serializes this RecipeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.enName, enName) || other.enName == enName)&&(identical(other.resepType, resepType) || other.resepType == resepType)&&(identical(other.classType, classType) || other.classType == classType)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.isBookmark, isBookmark) || other.isBookmark == isBookmark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,enName,resepType,classType,picture,isBookmark);

@override
String toString() {
  return 'RecipeResponse(id: $id, name: $name, enName: $enName, resepType: $resepType, classType: $classType, picture: $picture, isBookmark: $isBookmark)';
}


}

/// @nodoc
abstract mixin class $RecipeResponseCopyWith<$Res>  {
  factory $RecipeResponseCopyWith(RecipeResponse value, $Res Function(RecipeResponse) _then) = _$RecipeResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: 0) int id,@JsonKey(name: 'name', defaultValue: '') String name,@JsonKey(name: 'en_name', defaultValue: '') String enName,@JsonKey(name: 'reseptype', defaultValue: '') String resepType,@JsonKey(name: 'classtype', defaultValue: '') String classType,@JsonKey(name: 'picture', defaultValue: '') String picture,@JsonKey(name: 'is_bookmarked', defaultValue: false) bool isBookmark
});




}
/// @nodoc
class _$RecipeResponseCopyWithImpl<$Res>
    implements $RecipeResponseCopyWith<$Res> {
  _$RecipeResponseCopyWithImpl(this._self, this._then);

  final RecipeResponse _self;
  final $Res Function(RecipeResponse) _then;

/// Create a copy of RecipeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? enName = null,Object? resepType = null,Object? classType = null,Object? picture = null,Object? isBookmark = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,enName: null == enName ? _self.enName : enName // ignore: cast_nullable_to_non_nullable
as String,resepType: null == resepType ? _self.resepType : resepType // ignore: cast_nullable_to_non_nullable
as String,classType: null == classType ? _self.classType : classType // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,isBookmark: null == isBookmark ? _self.isBookmark : isBookmark // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeResponse].
extension RecipeResponsePatterns on RecipeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecipeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'en_name', defaultValue: '')  String enName, @JsonKey(name: 'reseptype', defaultValue: '')  String resepType, @JsonKey(name: 'classtype', defaultValue: '')  String classType, @JsonKey(name: 'picture', defaultValue: '')  String picture, @JsonKey(name: 'is_bookmarked', defaultValue: false)  bool isBookmark)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeResponse() when $default != null:
return $default(_that.id,_that.name,_that.enName,_that.resepType,_that.classType,_that.picture,_that.isBookmark);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'en_name', defaultValue: '')  String enName, @JsonKey(name: 'reseptype', defaultValue: '')  String resepType, @JsonKey(name: 'classtype', defaultValue: '')  String classType, @JsonKey(name: 'picture', defaultValue: '')  String picture, @JsonKey(name: 'is_bookmarked', defaultValue: false)  bool isBookmark)  $default,) {final _that = this;
switch (_that) {
case _RecipeResponse():
return $default(_that.id,_that.name,_that.enName,_that.resepType,_that.classType,_that.picture,_that.isBookmark);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: 0)  int id, @JsonKey(name: 'name', defaultValue: '')  String name, @JsonKey(name: 'en_name', defaultValue: '')  String enName, @JsonKey(name: 'reseptype', defaultValue: '')  String resepType, @JsonKey(name: 'classtype', defaultValue: '')  String classType, @JsonKey(name: 'picture', defaultValue: '')  String picture, @JsonKey(name: 'is_bookmarked', defaultValue: false)  bool isBookmark)?  $default,) {final _that = this;
switch (_that) {
case _RecipeResponse() when $default != null:
return $default(_that.id,_that.name,_that.enName,_that.resepType,_that.classType,_that.picture,_that.isBookmark);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeResponse extends RecipeResponse {
  const _RecipeResponse({@JsonKey(name: 'id', defaultValue: 0) required this.id, @JsonKey(name: 'name', defaultValue: '') required this.name, @JsonKey(name: 'en_name', defaultValue: '') required this.enName, @JsonKey(name: 'reseptype', defaultValue: '') required this.resepType, @JsonKey(name: 'classtype', defaultValue: '') required this.classType, @JsonKey(name: 'picture', defaultValue: '') required this.picture, @JsonKey(name: 'is_bookmarked', defaultValue: false) required this.isBookmark}): super._();
  factory _RecipeResponse.fromJson(Map<String, dynamic> json) => _$RecipeResponseFromJson(json);

@override@JsonKey(name: 'id', defaultValue: 0) final  int id;
@override@JsonKey(name: 'name', defaultValue: '') final  String name;
@override@JsonKey(name: 'en_name', defaultValue: '') final  String enName;
@override@JsonKey(name: 'reseptype', defaultValue: '') final  String resepType;
@override@JsonKey(name: 'classtype', defaultValue: '') final  String classType;
@override@JsonKey(name: 'picture', defaultValue: '') final  String picture;
@override@JsonKey(name: 'is_bookmarked', defaultValue: false) final  bool isBookmark;

/// Create a copy of RecipeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeResponseCopyWith<_RecipeResponse> get copyWith => __$RecipeResponseCopyWithImpl<_RecipeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.enName, enName) || other.enName == enName)&&(identical(other.resepType, resepType) || other.resepType == resepType)&&(identical(other.classType, classType) || other.classType == classType)&&(identical(other.picture, picture) || other.picture == picture)&&(identical(other.isBookmark, isBookmark) || other.isBookmark == isBookmark));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,enName,resepType,classType,picture,isBookmark);

@override
String toString() {
  return 'RecipeResponse(id: $id, name: $name, enName: $enName, resepType: $resepType, classType: $classType, picture: $picture, isBookmark: $isBookmark)';
}


}

/// @nodoc
abstract mixin class _$RecipeResponseCopyWith<$Res> implements $RecipeResponseCopyWith<$Res> {
  factory _$RecipeResponseCopyWith(_RecipeResponse value, $Res Function(_RecipeResponse) _then) = __$RecipeResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: 0) int id,@JsonKey(name: 'name', defaultValue: '') String name,@JsonKey(name: 'en_name', defaultValue: '') String enName,@JsonKey(name: 'reseptype', defaultValue: '') String resepType,@JsonKey(name: 'classtype', defaultValue: '') String classType,@JsonKey(name: 'picture', defaultValue: '') String picture,@JsonKey(name: 'is_bookmarked', defaultValue: false) bool isBookmark
});




}
/// @nodoc
class __$RecipeResponseCopyWithImpl<$Res>
    implements _$RecipeResponseCopyWith<$Res> {
  __$RecipeResponseCopyWithImpl(this._self, this._then);

  final _RecipeResponse _self;
  final $Res Function(_RecipeResponse) _then;

/// Create a copy of RecipeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? enName = null,Object? resepType = null,Object? classType = null,Object? picture = null,Object? isBookmark = null,}) {
  return _then(_RecipeResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,enName: null == enName ? _self.enName : enName // ignore: cast_nullable_to_non_nullable
as String,resepType: null == resepType ? _self.resepType : resepType // ignore: cast_nullable_to_non_nullable
as String,classType: null == classType ? _self.classType : classType // ignore: cast_nullable_to_non_nullable
as String,picture: null == picture ? _self.picture : picture // ignore: cast_nullable_to_non_nullable
as String,isBookmark: null == isBookmark ? _self.isBookmark : isBookmark // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
