// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_list_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeListEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeListEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RecipeListEffect()';
}


}

/// @nodoc
class $RecipeListEffectCopyWith<$Res>  {
$RecipeListEffectCopyWith(RecipeListEffect _, $Res Function(RecipeListEffect) __);
}


/// Adds pattern-matching-related methods to [RecipeListEffect].
extension RecipeListEffectPatterns on RecipeListEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToastError value)?  toastError,TResult Function( _ToastSuccess value)?  toastSuccess,TResult Function( _OpenReceiptDetail value)?  openReceiptDetail,TResult Function( _OpenSearchRecipe value)?  openSearchRecipe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that);case _OpenReceiptDetail() when openReceiptDetail != null:
return openReceiptDetail(_that);case _OpenSearchRecipe() when openSearchRecipe != null:
return openSearchRecipe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToastError value)  toastError,required TResult Function( _ToastSuccess value)  toastSuccess,required TResult Function( _OpenReceiptDetail value)  openReceiptDetail,required TResult Function( _OpenSearchRecipe value)  openSearchRecipe,}){
final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that);case _ToastSuccess():
return toastSuccess(_that);case _OpenReceiptDetail():
return openReceiptDetail(_that);case _OpenSearchRecipe():
return openSearchRecipe(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToastError value)?  toastError,TResult? Function( _ToastSuccess value)?  toastSuccess,TResult? Function( _OpenReceiptDetail value)?  openReceiptDetail,TResult? Function( _OpenSearchRecipe value)?  openSearchRecipe,}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that);case _OpenReceiptDetail() when openReceiptDetail != null:
return openReceiptDetail(_that);case _OpenSearchRecipe() when openSearchRecipe != null:
return openSearchRecipe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String messgae)?  toastError,TResult Function( String messgae)?  toastSuccess,TResult Function( RecipeItem item)?  openReceiptDetail,TResult Function()?  openSearchRecipe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.messgae);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that.messgae);case _OpenReceiptDetail() when openReceiptDetail != null:
return openReceiptDetail(_that.item);case _OpenSearchRecipe() when openSearchRecipe != null:
return openSearchRecipe();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String messgae)  toastError,required TResult Function( String messgae)  toastSuccess,required TResult Function( RecipeItem item)  openReceiptDetail,required TResult Function()  openSearchRecipe,}) {final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that.messgae);case _ToastSuccess():
return toastSuccess(_that.messgae);case _OpenReceiptDetail():
return openReceiptDetail(_that.item);case _OpenSearchRecipe():
return openSearchRecipe();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String messgae)?  toastError,TResult? Function( String messgae)?  toastSuccess,TResult? Function( RecipeItem item)?  openReceiptDetail,TResult? Function()?  openSearchRecipe,}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.messgae);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that.messgae);case _OpenReceiptDetail() when openReceiptDetail != null:
return openReceiptDetail(_that.item);case _OpenSearchRecipe() when openSearchRecipe != null:
return openSearchRecipe();case _:
  return null;

}
}

}

/// @nodoc


class _ToastError implements RecipeListEffect {
  const _ToastError(this.messgae);
  

 final  String messgae;

/// Create a copy of RecipeListEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToastErrorCopyWith<_ToastError> get copyWith => __$ToastErrorCopyWithImpl<_ToastError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToastError&&(identical(other.messgae, messgae) || other.messgae == messgae));
}


@override
int get hashCode => Object.hash(runtimeType,messgae);

@override
String toString() {
  return 'RecipeListEffect.toastError(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastErrorCopyWith<$Res> implements $RecipeListEffectCopyWith<$Res> {
  factory _$ToastErrorCopyWith(_ToastError value, $Res Function(_ToastError) _then) = __$ToastErrorCopyWithImpl;
@useResult
$Res call({
 String messgae
});




}
/// @nodoc
class __$ToastErrorCopyWithImpl<$Res>
    implements _$ToastErrorCopyWith<$Res> {
  __$ToastErrorCopyWithImpl(this._self, this._then);

  final _ToastError _self;
  final $Res Function(_ToastError) _then;

/// Create a copy of RecipeListEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastError(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToastSuccess implements RecipeListEffect {
  const _ToastSuccess(this.messgae);
  

 final  String messgae;

/// Create a copy of RecipeListEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToastSuccessCopyWith<_ToastSuccess> get copyWith => __$ToastSuccessCopyWithImpl<_ToastSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToastSuccess&&(identical(other.messgae, messgae) || other.messgae == messgae));
}


@override
int get hashCode => Object.hash(runtimeType,messgae);

@override
String toString() {
  return 'RecipeListEffect.toastSuccess(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastSuccessCopyWith<$Res> implements $RecipeListEffectCopyWith<$Res> {
  factory _$ToastSuccessCopyWith(_ToastSuccess value, $Res Function(_ToastSuccess) _then) = __$ToastSuccessCopyWithImpl;
@useResult
$Res call({
 String messgae
});




}
/// @nodoc
class __$ToastSuccessCopyWithImpl<$Res>
    implements _$ToastSuccessCopyWith<$Res> {
  __$ToastSuccessCopyWithImpl(this._self, this._then);

  final _ToastSuccess _self;
  final $Res Function(_ToastSuccess) _then;

/// Create a copy of RecipeListEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastSuccess(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OpenReceiptDetail implements RecipeListEffect {
  const _OpenReceiptDetail(this.item);
  

 final  RecipeItem item;

/// Create a copy of RecipeListEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenReceiptDetailCopyWith<_OpenReceiptDetail> get copyWith => __$OpenReceiptDetailCopyWithImpl<_OpenReceiptDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenReceiptDetail&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'RecipeListEffect.openReceiptDetail(item: $item)';
}


}

/// @nodoc
abstract mixin class _$OpenReceiptDetailCopyWith<$Res> implements $RecipeListEffectCopyWith<$Res> {
  factory _$OpenReceiptDetailCopyWith(_OpenReceiptDetail value, $Res Function(_OpenReceiptDetail) _then) = __$OpenReceiptDetailCopyWithImpl;
@useResult
$Res call({
 RecipeItem item
});


$RecipeItemCopyWith<$Res> get item;

}
/// @nodoc
class __$OpenReceiptDetailCopyWithImpl<$Res>
    implements _$OpenReceiptDetailCopyWith<$Res> {
  __$OpenReceiptDetailCopyWithImpl(this._self, this._then);

  final _OpenReceiptDetail _self;
  final $Res Function(_OpenReceiptDetail) _then;

/// Create a copy of RecipeListEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_OpenReceiptDetail(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as RecipeItem,
  ));
}

/// Create a copy of RecipeListEffect
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeItemCopyWith<$Res> get item {
  
  return $RecipeItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class _OpenSearchRecipe implements RecipeListEffect {
  const _OpenSearchRecipe();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenSearchRecipe);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RecipeListEffect.openSearchRecipe()';
}


}




// dart format on
