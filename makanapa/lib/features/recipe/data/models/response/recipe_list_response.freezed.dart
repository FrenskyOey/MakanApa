// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeListResponse {

@JsonKey(name: 'resep_list', defaultValue: List.empty) List<RecipeResponse> get items;@JsonKey(name: 'next_cursor', defaultValue: 0) int get nextCursors;@JsonKey(name: 'limit', defaultValue: 25) int get limits;@JsonKey(name: 'next_data_counter', defaultValue: 0) int get dataCounters;
/// Create a copy of RecipeListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeListResponseCopyWith<RecipeListResponse> get copyWith => _$RecipeListResponseCopyWithImpl<RecipeListResponse>(this as RecipeListResponse, _$identity);

  /// Serializes this RecipeListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeListResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nextCursors, nextCursors) || other.nextCursors == nextCursors)&&(identical(other.limits, limits) || other.limits == limits)&&(identical(other.dataCounters, dataCounters) || other.dataCounters == dataCounters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nextCursors,limits,dataCounters);

@override
String toString() {
  return 'RecipeListResponse(items: $items, nextCursors: $nextCursors, limits: $limits, dataCounters: $dataCounters)';
}


}

/// @nodoc
abstract mixin class $RecipeListResponseCopyWith<$Res>  {
  factory $RecipeListResponseCopyWith(RecipeListResponse value, $Res Function(RecipeListResponse) _then) = _$RecipeListResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'resep_list', defaultValue: List.empty) List<RecipeResponse> items,@JsonKey(name: 'next_cursor', defaultValue: 0) int nextCursors,@JsonKey(name: 'limit', defaultValue: 25) int limits,@JsonKey(name: 'next_data_counter', defaultValue: 0) int dataCounters
});




}
/// @nodoc
class _$RecipeListResponseCopyWithImpl<$Res>
    implements $RecipeListResponseCopyWith<$Res> {
  _$RecipeListResponseCopyWithImpl(this._self, this._then);

  final RecipeListResponse _self;
  final $Res Function(RecipeListResponse) _then;

/// Create a copy of RecipeListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextCursors = null,Object? limits = null,Object? dataCounters = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RecipeResponse>,nextCursors: null == nextCursors ? _self.nextCursors : nextCursors // ignore: cast_nullable_to_non_nullable
as int,limits: null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as int,dataCounters: null == dataCounters ? _self.dataCounters : dataCounters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeListResponse].
extension RecipeListResponsePatterns on RecipeListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeListResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecipeListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'resep_list', defaultValue: List.empty)  List<RecipeResponse> items, @JsonKey(name: 'next_cursor', defaultValue: 0)  int nextCursors, @JsonKey(name: 'limit', defaultValue: 25)  int limits, @JsonKey(name: 'next_data_counter', defaultValue: 0)  int dataCounters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeListResponse() when $default != null:
return $default(_that.items,_that.nextCursors,_that.limits,_that.dataCounters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'resep_list', defaultValue: List.empty)  List<RecipeResponse> items, @JsonKey(name: 'next_cursor', defaultValue: 0)  int nextCursors, @JsonKey(name: 'limit', defaultValue: 25)  int limits, @JsonKey(name: 'next_data_counter', defaultValue: 0)  int dataCounters)  $default,) {final _that = this;
switch (_that) {
case _RecipeListResponse():
return $default(_that.items,_that.nextCursors,_that.limits,_that.dataCounters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'resep_list', defaultValue: List.empty)  List<RecipeResponse> items, @JsonKey(name: 'next_cursor', defaultValue: 0)  int nextCursors, @JsonKey(name: 'limit', defaultValue: 25)  int limits, @JsonKey(name: 'next_data_counter', defaultValue: 0)  int dataCounters)?  $default,) {final _that = this;
switch (_that) {
case _RecipeListResponse() when $default != null:
return $default(_that.items,_that.nextCursors,_that.limits,_that.dataCounters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeListResponse extends RecipeListResponse {
  const _RecipeListResponse({@JsonKey(name: 'resep_list', defaultValue: List.empty) required final  List<RecipeResponse> items, @JsonKey(name: 'next_cursor', defaultValue: 0) required this.nextCursors, @JsonKey(name: 'limit', defaultValue: 25) required this.limits, @JsonKey(name: 'next_data_counter', defaultValue: 0) required this.dataCounters}): _items = items,super._();
  factory _RecipeListResponse.fromJson(Map<String, dynamic> json) => _$RecipeListResponseFromJson(json);

 final  List<RecipeResponse> _items;
@override@JsonKey(name: 'resep_list', defaultValue: List.empty) List<RecipeResponse> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'next_cursor', defaultValue: 0) final  int nextCursors;
@override@JsonKey(name: 'limit', defaultValue: 25) final  int limits;
@override@JsonKey(name: 'next_data_counter', defaultValue: 0) final  int dataCounters;

/// Create a copy of RecipeListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeListResponseCopyWith<_RecipeListResponse> get copyWith => __$RecipeListResponseCopyWithImpl<_RecipeListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeListResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nextCursors, nextCursors) || other.nextCursors == nextCursors)&&(identical(other.limits, limits) || other.limits == limits)&&(identical(other.dataCounters, dataCounters) || other.dataCounters == dataCounters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextCursors,limits,dataCounters);

@override
String toString() {
  return 'RecipeListResponse(items: $items, nextCursors: $nextCursors, limits: $limits, dataCounters: $dataCounters)';
}


}

/// @nodoc
abstract mixin class _$RecipeListResponseCopyWith<$Res> implements $RecipeListResponseCopyWith<$Res> {
  factory _$RecipeListResponseCopyWith(_RecipeListResponse value, $Res Function(_RecipeListResponse) _then) = __$RecipeListResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'resep_list', defaultValue: List.empty) List<RecipeResponse> items,@JsonKey(name: 'next_cursor', defaultValue: 0) int nextCursors,@JsonKey(name: 'limit', defaultValue: 25) int limits,@JsonKey(name: 'next_data_counter', defaultValue: 0) int dataCounters
});




}
/// @nodoc
class __$RecipeListResponseCopyWithImpl<$Res>
    implements _$RecipeListResponseCopyWith<$Res> {
  __$RecipeListResponseCopyWithImpl(this._self, this._then);

  final _RecipeListResponse _self;
  final $Res Function(_RecipeListResponse) _then;

/// Create a copy of RecipeListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursors = null,Object? limits = null,Object? dataCounters = null,}) {
  return _then(_RecipeListResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RecipeResponse>,nextCursors: null == nextCursors ? _self.nextCursors : nextCursors // ignore: cast_nullable_to_non_nullable
as int,limits: null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as int,dataCounters: null == dataCounters ? _self.dataCounters : dataCounters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
