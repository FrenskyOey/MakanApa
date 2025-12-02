// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEventState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEventState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEventState()';
}


}

/// @nodoc
class $LoginEventStateCopyWith<$Res>  {
$LoginEventStateCopyWith(LoginEventState _, $Res Function(LoginEventState) __);
}


/// Adds pattern-matching-related methods to [LoginEventState].
extension LoginEventStatePatterns on LoginEventState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ShowLoading value)?  showLoading,TResult Function( _ToastError value)?  toastError,TResult Function( _ToHomePage value)?  toHomePage,TResult Function( _ToSignUpPage value)?  toSignUpPage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShowLoading() when showLoading != null:
return showLoading(_that);case _ToastError() when toastError != null:
return toastError(_that);case _ToHomePage() when toHomePage != null:
return toHomePage(_that);case _ToSignUpPage() when toSignUpPage != null:
return toSignUpPage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ShowLoading value)  showLoading,required TResult Function( _ToastError value)  toastError,required TResult Function( _ToHomePage value)  toHomePage,required TResult Function( _ToSignUpPage value)  toSignUpPage,}){
final _that = this;
switch (_that) {
case _ShowLoading():
return showLoading(_that);case _ToastError():
return toastError(_that);case _ToHomePage():
return toHomePage(_that);case _ToSignUpPage():
return toSignUpPage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ShowLoading value)?  showLoading,TResult? Function( _ToastError value)?  toastError,TResult? Function( _ToHomePage value)?  toHomePage,TResult? Function( _ToSignUpPage value)?  toSignUpPage,}){
final _that = this;
switch (_that) {
case _ShowLoading() when showLoading != null:
return showLoading(_that);case _ToastError() when toastError != null:
return toastError(_that);case _ToHomePage() when toHomePage != null:
return toHomePage(_that);case _ToSignUpPage() when toSignUpPage != null:
return toSignUpPage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  showLoading,TResult Function( String messgae)?  toastError,TResult Function()?  toHomePage,TResult Function()?  toSignUpPage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowLoading() when showLoading != null:
return showLoading();case _ToastError() when toastError != null:
return toastError(_that.messgae);case _ToHomePage() when toHomePage != null:
return toHomePage();case _ToSignUpPage() when toSignUpPage != null:
return toSignUpPage();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  showLoading,required TResult Function( String messgae)  toastError,required TResult Function()  toHomePage,required TResult Function()  toSignUpPage,}) {final _that = this;
switch (_that) {
case _ShowLoading():
return showLoading();case _ToastError():
return toastError(_that.messgae);case _ToHomePage():
return toHomePage();case _ToSignUpPage():
return toSignUpPage();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  showLoading,TResult? Function( String messgae)?  toastError,TResult? Function()?  toHomePage,TResult? Function()?  toSignUpPage,}) {final _that = this;
switch (_that) {
case _ShowLoading() when showLoading != null:
return showLoading();case _ToastError() when toastError != null:
return toastError(_that.messgae);case _ToHomePage() when toHomePage != null:
return toHomePage();case _ToSignUpPage() when toSignUpPage != null:
return toSignUpPage();case _:
  return null;

}
}

}

/// @nodoc


class _ShowLoading implements LoginEventState {
  const _ShowLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEventState.showLoading()';
}


}




/// @nodoc


class _ToastError implements LoginEventState {
  const _ToastError(this.messgae);
  

 final  String messgae;

/// Create a copy of LoginEventState
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
  return 'LoginEventState.toastError(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastErrorCopyWith<$Res> implements $LoginEventStateCopyWith<$Res> {
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

/// Create a copy of LoginEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastError(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToHomePage implements LoginEventState {
  const _ToHomePage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToHomePage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEventState.toHomePage()';
}


}




/// @nodoc


class _ToSignUpPage implements LoginEventState {
  const _ToSignUpPage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToSignUpPage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEventState.toSignUpPage()';
}


}




// dart format on
