// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqResponse {

@JsonKey(name: 'id', defaultValue: '') String get id;@JsonKey(name: 'title', defaultValue: '') String get title;@JsonKey(name: 'content', defaultValue: '') String get content;
/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqResponseCopyWith<FaqResponse> get copyWith => _$FaqResponseCopyWithImpl<FaqResponse>(this as FaqResponse, _$identity);

  /// Serializes this FaqResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content);

@override
String toString() {
  return 'FaqResponse(id: $id, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class $FaqResponseCopyWith<$Res>  {
  factory $FaqResponseCopyWith(FaqResponse value, $Res Function(FaqResponse) _then) = _$FaqResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: '') String id,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'content', defaultValue: '') String content
});




}
/// @nodoc
class _$FaqResponseCopyWithImpl<$Res>
    implements $FaqResponseCopyWith<$Res> {
  _$FaqResponseCopyWithImpl(this._self, this._then);

  final FaqResponse _self;
  final $Res Function(FaqResponse) _then;

/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqResponse].
extension FaqResponsePatterns on FaqResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqResponse value)  $default,){
final _that = this;
switch (_that) {
case _FaqResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FaqResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: '')  String id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'content', defaultValue: '')  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqResponse() when $default != null:
return $default(_that.id,_that.title,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: '')  String id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'content', defaultValue: '')  String content)  $default,) {final _that = this;
switch (_that) {
case _FaqResponse():
return $default(_that.id,_that.title,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: '')  String id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'content', defaultValue: '')  String content)?  $default,) {final _that = this;
switch (_that) {
case _FaqResponse() when $default != null:
return $default(_that.id,_that.title,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqResponse extends FaqResponse {
  const _FaqResponse({@JsonKey(name: 'id', defaultValue: '') required this.id, @JsonKey(name: 'title', defaultValue: '') required this.title, @JsonKey(name: 'content', defaultValue: '') required this.content}): super._();
  factory _FaqResponse.fromJson(Map<String, dynamic> json) => _$FaqResponseFromJson(json);

@override@JsonKey(name: 'id', defaultValue: '') final  String id;
@override@JsonKey(name: 'title', defaultValue: '') final  String title;
@override@JsonKey(name: 'content', defaultValue: '') final  String content;

/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqResponseCopyWith<_FaqResponse> get copyWith => __$FaqResponseCopyWithImpl<_FaqResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content);

@override
String toString() {
  return 'FaqResponse(id: $id, title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$FaqResponseCopyWith<$Res> implements $FaqResponseCopyWith<$Res> {
  factory _$FaqResponseCopyWith(_FaqResponse value, $Res Function(_FaqResponse) _then) = __$FaqResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: '') String id,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'content', defaultValue: '') String content
});




}
/// @nodoc
class __$FaqResponseCopyWithImpl<$Res>
    implements _$FaqResponseCopyWith<$Res> {
  __$FaqResponseCopyWithImpl(this._self, this._then);

  final _FaqResponse _self;
  final $Res Function(_FaqResponse) _then;

/// Create a copy of FaqResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,}) {
  return _then(_FaqResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
