// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeDetailResponse {

@JsonKey(name: 'resep') RecipeResponse get recipe;@JsonKey(name: 'bahan', defaultValue: List.empty) List<IngredientsResponse> get ingredients;
/// Create a copy of RecipeDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDetailResponseCopyWith<RecipeDetailResponse> get copyWith => _$RecipeDetailResponseCopyWithImpl<RecipeDetailResponse>(this as RecipeDetailResponse, _$identity);

  /// Serializes this RecipeDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDetailResponse&&(identical(other.recipe, recipe) || other.recipe == recipe)&&const DeepCollectionEquality().equals(other.ingredients, ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipe,const DeepCollectionEquality().hash(ingredients));

@override
String toString() {
  return 'RecipeDetailResponse(recipe: $recipe, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $RecipeDetailResponseCopyWith<$Res>  {
  factory $RecipeDetailResponseCopyWith(RecipeDetailResponse value, $Res Function(RecipeDetailResponse) _then) = _$RecipeDetailResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'resep') RecipeResponse recipe,@JsonKey(name: 'bahan', defaultValue: List.empty) List<IngredientsResponse> ingredients
});


$RecipeResponseCopyWith<$Res> get recipe;

}
/// @nodoc
class _$RecipeDetailResponseCopyWithImpl<$Res>
    implements $RecipeDetailResponseCopyWith<$Res> {
  _$RecipeDetailResponseCopyWithImpl(this._self, this._then);

  final RecipeDetailResponse _self;
  final $Res Function(RecipeDetailResponse) _then;

/// Create a copy of RecipeDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipe = null,Object? ingredients = null,}) {
  return _then(_self.copyWith(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeResponse,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientsResponse>,
  ));
}
/// Create a copy of RecipeDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeResponseCopyWith<$Res> get recipe {
  
  return $RecipeResponseCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipeDetailResponse].
extension RecipeDetailResponsePatterns on RecipeDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecipeDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'resep')  RecipeResponse recipe, @JsonKey(name: 'bahan', defaultValue: List.empty)  List<IngredientsResponse> ingredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDetailResponse() when $default != null:
return $default(_that.recipe,_that.ingredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'resep')  RecipeResponse recipe, @JsonKey(name: 'bahan', defaultValue: List.empty)  List<IngredientsResponse> ingredients)  $default,) {final _that = this;
switch (_that) {
case _RecipeDetailResponse():
return $default(_that.recipe,_that.ingredients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'resep')  RecipeResponse recipe, @JsonKey(name: 'bahan', defaultValue: List.empty)  List<IngredientsResponse> ingredients)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDetailResponse() when $default != null:
return $default(_that.recipe,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeDetailResponse extends RecipeDetailResponse {
  const _RecipeDetailResponse({@JsonKey(name: 'resep') required this.recipe, @JsonKey(name: 'bahan', defaultValue: List.empty) required final  List<IngredientsResponse> ingredients}): _ingredients = ingredients,super._();
  factory _RecipeDetailResponse.fromJson(Map<String, dynamic> json) => _$RecipeDetailResponseFromJson(json);

@override@JsonKey(name: 'resep') final  RecipeResponse recipe;
 final  List<IngredientsResponse> _ingredients;
@override@JsonKey(name: 'bahan', defaultValue: List.empty) List<IngredientsResponse> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of RecipeDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDetailResponseCopyWith<_RecipeDetailResponse> get copyWith => __$RecipeDetailResponseCopyWithImpl<_RecipeDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDetailResponse&&(identical(other.recipe, recipe) || other.recipe == recipe)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipe,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'RecipeDetailResponse(recipe: $recipe, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$RecipeDetailResponseCopyWith<$Res> implements $RecipeDetailResponseCopyWith<$Res> {
  factory _$RecipeDetailResponseCopyWith(_RecipeDetailResponse value, $Res Function(_RecipeDetailResponse) _then) = __$RecipeDetailResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'resep') RecipeResponse recipe,@JsonKey(name: 'bahan', defaultValue: List.empty) List<IngredientsResponse> ingredients
});


@override $RecipeResponseCopyWith<$Res> get recipe;

}
/// @nodoc
class __$RecipeDetailResponseCopyWithImpl<$Res>
    implements _$RecipeDetailResponseCopyWith<$Res> {
  __$RecipeDetailResponseCopyWithImpl(this._self, this._then);

  final _RecipeDetailResponse _self;
  final $Res Function(_RecipeDetailResponse) _then;

/// Create a copy of RecipeDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipe = null,Object? ingredients = null,}) {
  return _then(_RecipeDetailResponse(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeResponse,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientsResponse>,
  ));
}

/// Create a copy of RecipeDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeResponseCopyWith<$Res> get recipe {
  
  return $RecipeResponseCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
