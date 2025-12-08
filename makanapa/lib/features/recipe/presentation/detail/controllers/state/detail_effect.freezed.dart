// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailEffect()';
}


}

/// @nodoc
class $DetailEffectCopyWith<$Res>  {
$DetailEffectCopyWith(DetailEffect _, $Res Function(DetailEffect) __);
}


/// Adds pattern-matching-related methods to [DetailEffect].
extension DetailEffectPatterns on DetailEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToastError value)?  toastError,TResult Function( _ToastSuccess value)?  toastSuccess,TResult Function( _OpenUrlLink value)?  openUrlLink,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that);case _OpenUrlLink() when openUrlLink != null:
return openUrlLink(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToastError value)  toastError,required TResult Function( _ToastSuccess value)  toastSuccess,required TResult Function( _OpenUrlLink value)  openUrlLink,}){
final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that);case _ToastSuccess():
return toastSuccess(_that);case _OpenUrlLink():
return openUrlLink(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToastError value)?  toastError,TResult? Function( _ToastSuccess value)?  toastSuccess,TResult? Function( _OpenUrlLink value)?  openUrlLink,}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that);case _OpenUrlLink() when openUrlLink != null:
return openUrlLink(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String messgae)?  toastError,TResult Function( String messgae)?  toastSuccess,TResult Function( String url)?  openUrlLink,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.messgae);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that.messgae);case _OpenUrlLink() when openUrlLink != null:
return openUrlLink(_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String messgae)  toastError,required TResult Function( String messgae)  toastSuccess,required TResult Function( String url)  openUrlLink,}) {final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that.messgae);case _ToastSuccess():
return toastSuccess(_that.messgae);case _OpenUrlLink():
return openUrlLink(_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String messgae)?  toastError,TResult? Function( String messgae)?  toastSuccess,TResult? Function( String url)?  openUrlLink,}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.messgae);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that.messgae);case _OpenUrlLink() when openUrlLink != null:
return openUrlLink(_that.url);case _:
  return null;

}
}

}

/// @nodoc


class _ToastError implements DetailEffect {
  const _ToastError(this.messgae);
  

 final  String messgae;

/// Create a copy of DetailEffect
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
  return 'DetailEffect.toastError(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastErrorCopyWith<$Res> implements $DetailEffectCopyWith<$Res> {
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

/// Create a copy of DetailEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastError(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToastSuccess implements DetailEffect {
  const _ToastSuccess(this.messgae);
  

 final  String messgae;

/// Create a copy of DetailEffect
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
  return 'DetailEffect.toastSuccess(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastSuccessCopyWith<$Res> implements $DetailEffectCopyWith<$Res> {
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

/// Create a copy of DetailEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastSuccess(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OpenUrlLink implements DetailEffect {
  const _OpenUrlLink(this.url);
  

 final  String url;

/// Create a copy of DetailEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenUrlLinkCopyWith<_OpenUrlLink> get copyWith => __$OpenUrlLinkCopyWithImpl<_OpenUrlLink>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenUrlLink&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'DetailEffect.openUrlLink(url: $url)';
}


}

/// @nodoc
abstract mixin class _$OpenUrlLinkCopyWith<$Res> implements $DetailEffectCopyWith<$Res> {
  factory _$OpenUrlLinkCopyWith(_OpenUrlLink value, $Res Function(_OpenUrlLink) _then) = __$OpenUrlLinkCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class __$OpenUrlLinkCopyWithImpl<$Res>
    implements _$OpenUrlLinkCopyWith<$Res> {
  __$OpenUrlLinkCopyWithImpl(this._self, this._then);

  final _OpenUrlLink _self;
  final $Res Function(_OpenUrlLink) _then;

/// Create a copy of DetailEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(_OpenUrlLink(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
