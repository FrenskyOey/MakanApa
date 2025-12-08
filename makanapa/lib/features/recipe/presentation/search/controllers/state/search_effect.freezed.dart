// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEffect()';
}


}

/// @nodoc
class $SearchEffectCopyWith<$Res>  {
$SearchEffectCopyWith(SearchEffect _, $Res Function(SearchEffect) __);
}


/// Adds pattern-matching-related methods to [SearchEffect].
extension SearchEffectPatterns on SearchEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToastError value)?  toastError,TResult Function( _OpenDetailPage value)?  openDetailPage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _OpenDetailPage() when openDetailPage != null:
return openDetailPage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToastError value)  toastError,required TResult Function( _OpenDetailPage value)  openDetailPage,}){
final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that);case _OpenDetailPage():
return openDetailPage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToastError value)?  toastError,TResult? Function( _OpenDetailPage value)?  openDetailPage,}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _OpenDetailPage() when openDetailPage != null:
return openDetailPage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String messgae)?  toastError,TResult Function( RecipeItem item)?  openDetailPage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.messgae);case _OpenDetailPage() when openDetailPage != null:
return openDetailPage(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String messgae)  toastError,required TResult Function( RecipeItem item)  openDetailPage,}) {final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that.messgae);case _OpenDetailPage():
return openDetailPage(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String messgae)?  toastError,TResult? Function( RecipeItem item)?  openDetailPage,}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.messgae);case _OpenDetailPage() when openDetailPage != null:
return openDetailPage(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _ToastError implements SearchEffect {
  const _ToastError(this.messgae);
  

 final  String messgae;

/// Create a copy of SearchEffect
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
  return 'SearchEffect.toastError(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastErrorCopyWith<$Res> implements $SearchEffectCopyWith<$Res> {
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

/// Create a copy of SearchEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastError(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OpenDetailPage implements SearchEffect {
  const _OpenDetailPage(this.item);
  

 final  RecipeItem item;

/// Create a copy of SearchEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenDetailPageCopyWith<_OpenDetailPage> get copyWith => __$OpenDetailPageCopyWithImpl<_OpenDetailPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenDetailPage&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'SearchEffect.openDetailPage(item: $item)';
}


}

/// @nodoc
abstract mixin class _$OpenDetailPageCopyWith<$Res> implements $SearchEffectCopyWith<$Res> {
  factory _$OpenDetailPageCopyWith(_OpenDetailPage value, $Res Function(_OpenDetailPage) _then) = __$OpenDetailPageCopyWithImpl;
@useResult
$Res call({
 RecipeItem item
});


$RecipeItemCopyWith<$Res> get item;

}
/// @nodoc
class __$OpenDetailPageCopyWithImpl<$Res>
    implements _$OpenDetailPageCopyWith<$Res> {
  __$OpenDetailPageCopyWithImpl(this._self, this._then);

  final _OpenDetailPage _self;
  final $Res Function(_OpenDetailPage) _then;

/// Create a copy of SearchEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_OpenDetailPage(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as RecipeItem,
  ));
}

/// Create a copy of SearchEffect
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeItemCopyWith<$Res> get item {
  
  return $RecipeItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
