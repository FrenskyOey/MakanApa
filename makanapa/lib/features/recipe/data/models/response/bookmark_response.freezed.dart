// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkResponse {

@JsonKey(name: 'recipe_id', defaultValue: 0) int get id;@JsonKey(name: 'is_bookmarked') bool get isBookmark;@JsonKey(name: 'action_type', defaultValue: '') String get action;
/// Create a copy of BookmarkResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkResponseCopyWith<BookmarkResponse> get copyWith => _$BookmarkResponseCopyWithImpl<BookmarkResponse>(this as BookmarkResponse, _$identity);

  /// Serializes this BookmarkResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.isBookmark, isBookmark) || other.isBookmark == isBookmark)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isBookmark,action);

@override
String toString() {
  return 'BookmarkResponse(id: $id, isBookmark: $isBookmark, action: $action)';
}


}

/// @nodoc
abstract mixin class $BookmarkResponseCopyWith<$Res>  {
  factory $BookmarkResponseCopyWith(BookmarkResponse value, $Res Function(BookmarkResponse) _then) = _$BookmarkResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'recipe_id', defaultValue: 0) int id,@JsonKey(name: 'is_bookmarked') bool isBookmark,@JsonKey(name: 'action_type', defaultValue: '') String action
});




}
/// @nodoc
class _$BookmarkResponseCopyWithImpl<$Res>
    implements $BookmarkResponseCopyWith<$Res> {
  _$BookmarkResponseCopyWithImpl(this._self, this._then);

  final BookmarkResponse _self;
  final $Res Function(BookmarkResponse) _then;

/// Create a copy of BookmarkResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isBookmark = null,Object? action = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isBookmark: null == isBookmark ? _self.isBookmark : isBookmark // ignore: cast_nullable_to_non_nullable
as bool,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookmarkResponse].
extension BookmarkResponsePatterns on BookmarkResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookmarkResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookmarkResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookmarkResponse value)  $default,){
final _that = this;
switch (_that) {
case _BookmarkResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookmarkResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BookmarkResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'recipe_id', defaultValue: 0)  int id, @JsonKey(name: 'is_bookmarked')  bool isBookmark, @JsonKey(name: 'action_type', defaultValue: '')  String action)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookmarkResponse() when $default != null:
return $default(_that.id,_that.isBookmark,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'recipe_id', defaultValue: 0)  int id, @JsonKey(name: 'is_bookmarked')  bool isBookmark, @JsonKey(name: 'action_type', defaultValue: '')  String action)  $default,) {final _that = this;
switch (_that) {
case _BookmarkResponse():
return $default(_that.id,_that.isBookmark,_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'recipe_id', defaultValue: 0)  int id, @JsonKey(name: 'is_bookmarked')  bool isBookmark, @JsonKey(name: 'action_type', defaultValue: '')  String action)?  $default,) {final _that = this;
switch (_that) {
case _BookmarkResponse() when $default != null:
return $default(_that.id,_that.isBookmark,_that.action);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookmarkResponse extends BookmarkResponse {
  const _BookmarkResponse({@JsonKey(name: 'recipe_id', defaultValue: 0) required this.id, @JsonKey(name: 'is_bookmarked') this.isBookmark = false, @JsonKey(name: 'action_type', defaultValue: '') required this.action}): super._();
  factory _BookmarkResponse.fromJson(Map<String, dynamic> json) => _$BookmarkResponseFromJson(json);

@override@JsonKey(name: 'recipe_id', defaultValue: 0) final  int id;
@override@JsonKey(name: 'is_bookmarked') final  bool isBookmark;
@override@JsonKey(name: 'action_type', defaultValue: '') final  String action;

/// Create a copy of BookmarkResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkResponseCopyWith<_BookmarkResponse> get copyWith => __$BookmarkResponseCopyWithImpl<_BookmarkResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.isBookmark, isBookmark) || other.isBookmark == isBookmark)&&(identical(other.action, action) || other.action == action));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isBookmark,action);

@override
String toString() {
  return 'BookmarkResponse(id: $id, isBookmark: $isBookmark, action: $action)';
}


}

/// @nodoc
abstract mixin class _$BookmarkResponseCopyWith<$Res> implements $BookmarkResponseCopyWith<$Res> {
  factory _$BookmarkResponseCopyWith(_BookmarkResponse value, $Res Function(_BookmarkResponse) _then) = __$BookmarkResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'recipe_id', defaultValue: 0) int id,@JsonKey(name: 'is_bookmarked') bool isBookmark,@JsonKey(name: 'action_type', defaultValue: '') String action
});




}
/// @nodoc
class __$BookmarkResponseCopyWithImpl<$Res>
    implements _$BookmarkResponseCopyWith<$Res> {
  __$BookmarkResponseCopyWithImpl(this._self, this._then);

  final _BookmarkResponse _self;
  final $Res Function(_BookmarkResponse) _then;

/// Create a copy of BookmarkResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isBookmark = null,Object? action = null,}) {
  return _then(_BookmarkResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isBookmark: null == isBookmark ? _self.isBookmark : isBookmark // ignore: cast_nullable_to_non_nullable
as bool,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
