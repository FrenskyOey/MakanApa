// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEditEventState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditEventState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEventState()';
}


}

/// @nodoc
class $ProfileEditEventStateCopyWith<$Res>  {
$ProfileEditEventStateCopyWith(ProfileEditEventState _, $Res Function(ProfileEditEventState) __);
}


/// Adds pattern-matching-related methods to [ProfileEditEventState].
extension ProfileEditEventStatePatterns on ProfileEditEventState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _ToastError value)?  toastError,TResult Function( _SuccessUpdate value)?  successUpdate,TResult Function( _OpenGallery value)?  openGallery,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ToastError() when toastError != null:
return toastError(_that);case _SuccessUpdate() when successUpdate != null:
return successUpdate(_that);case _OpenGallery() when openGallery != null:
return openGallery(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _ToastError value)  toastError,required TResult Function( _SuccessUpdate value)  successUpdate,required TResult Function( _OpenGallery value)  openGallery,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _ToastError():
return toastError(_that);case _SuccessUpdate():
return successUpdate(_that);case _OpenGallery():
return openGallery(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _ToastError value)?  toastError,TResult? Function( _SuccessUpdate value)?  successUpdate,TResult? Function( _OpenGallery value)?  openGallery,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _ToastError() when toastError != null:
return toastError(_that);case _SuccessUpdate() when successUpdate != null:
return successUpdate(_that);case _OpenGallery() when openGallery != null:
return openGallery(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String messgae)?  toastError,TResult Function( UserData user)?  successUpdate,TResult Function()?  openGallery,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ToastError() when toastError != null:
return toastError(_that.messgae);case _SuccessUpdate() when successUpdate != null:
return successUpdate(_that.user);case _OpenGallery() when openGallery != null:
return openGallery();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String messgae)  toastError,required TResult Function( UserData user)  successUpdate,required TResult Function()  openGallery,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _ToastError():
return toastError(_that.messgae);case _SuccessUpdate():
return successUpdate(_that.user);case _OpenGallery():
return openGallery();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String messgae)?  toastError,TResult? Function( UserData user)?  successUpdate,TResult? Function()?  openGallery,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _ToastError() when toastError != null:
return toastError(_that.messgae);case _SuccessUpdate() when successUpdate != null:
return successUpdate(_that.user);case _OpenGallery() when openGallery != null:
return openGallery();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProfileEditEventState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEventState.initial()';
}


}




/// @nodoc


class _ToastError implements ProfileEditEventState {
  const _ToastError(this.messgae);
  

 final  String messgae;

/// Create a copy of ProfileEditEventState
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
  return 'ProfileEditEventState.toastError(messgae: $messgae)';
}


}

/// @nodoc
abstract mixin class _$ToastErrorCopyWith<$Res> implements $ProfileEditEventStateCopyWith<$Res> {
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

/// Create a copy of ProfileEditEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messgae = null,}) {
  return _then(_ToastError(
null == messgae ? _self.messgae : messgae // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SuccessUpdate implements ProfileEditEventState {
  const _SuccessUpdate(this.user);
  

 final  UserData user;

/// Create a copy of ProfileEditEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessUpdateCopyWith<_SuccessUpdate> get copyWith => __$SuccessUpdateCopyWithImpl<_SuccessUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessUpdate&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileEditEventState.successUpdate(user: $user)';
}


}

/// @nodoc
abstract mixin class _$SuccessUpdateCopyWith<$Res> implements $ProfileEditEventStateCopyWith<$Res> {
  factory _$SuccessUpdateCopyWith(_SuccessUpdate value, $Res Function(_SuccessUpdate) _then) = __$SuccessUpdateCopyWithImpl;
@useResult
$Res call({
 UserData user
});


$UserDataCopyWith<$Res> get user;

}
/// @nodoc
class __$SuccessUpdateCopyWithImpl<$Res>
    implements _$SuccessUpdateCopyWith<$Res> {
  __$SuccessUpdateCopyWithImpl(this._self, this._then);

  final _SuccessUpdate _self;
  final $Res Function(_SuccessUpdate) _then;

/// Create a copy of ProfileEditEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_SuccessUpdate(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserData,
  ));
}

/// Create a copy of ProfileEditEventState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get user {
  
  return $UserDataCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _OpenGallery implements ProfileEditEventState {
  const _OpenGallery();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenGallery);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditEventState.openGallery()';
}


}




// dart format on
