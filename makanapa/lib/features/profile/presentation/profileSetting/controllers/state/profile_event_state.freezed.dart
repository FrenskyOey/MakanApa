// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEventState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEventState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEventState()';
}


}

/// @nodoc
class $ProfileEventStateCopyWith<$Res>  {
$ProfileEventStateCopyWith(ProfileEventState _, $Res Function(ProfileEventState) __);
}


/// Adds pattern-matching-related methods to [ProfileEventState].
extension ProfileEventStatePatterns on ProfileEventState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _OpenEditProfile value)?  openEditProfile,TResult Function( _OpenChangePassword value)?  openChangePassword,TResult Function( _OpenAboutUs value)?  openAboutUs,TResult Function( _LogOut value)?  logout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _OpenEditProfile() when openEditProfile != null:
return openEditProfile(_that);case _OpenChangePassword() when openChangePassword != null:
return openChangePassword(_that);case _OpenAboutUs() when openAboutUs != null:
return openAboutUs(_that);case _LogOut() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _OpenEditProfile value)  openEditProfile,required TResult Function( _OpenChangePassword value)  openChangePassword,required TResult Function( _OpenAboutUs value)  openAboutUs,required TResult Function( _LogOut value)  logout,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _OpenEditProfile():
return openEditProfile(_that);case _OpenChangePassword():
return openChangePassword(_that);case _OpenAboutUs():
return openAboutUs(_that);case _LogOut():
return logout(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _OpenEditProfile value)?  openEditProfile,TResult? Function( _OpenChangePassword value)?  openChangePassword,TResult? Function( _OpenAboutUs value)?  openAboutUs,TResult? Function( _LogOut value)?  logout,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _OpenEditProfile() when openEditProfile != null:
return openEditProfile(_that);case _OpenChangePassword() when openChangePassword != null:
return openChangePassword(_that);case _OpenAboutUs() when openAboutUs != null:
return openAboutUs(_that);case _LogOut() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( UserData data)?  openEditProfile,TResult Function()?  openChangePassword,TResult Function()?  openAboutUs,TResult Function()?  logout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _OpenEditProfile() when openEditProfile != null:
return openEditProfile(_that.data);case _OpenChangePassword() when openChangePassword != null:
return openChangePassword();case _OpenAboutUs() when openAboutUs != null:
return openAboutUs();case _LogOut() when logout != null:
return logout();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( UserData data)  openEditProfile,required TResult Function()  openChangePassword,required TResult Function()  openAboutUs,required TResult Function()  logout,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _OpenEditProfile():
return openEditProfile(_that.data);case _OpenChangePassword():
return openChangePassword();case _OpenAboutUs():
return openAboutUs();case _LogOut():
return logout();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( UserData data)?  openEditProfile,TResult? Function()?  openChangePassword,TResult? Function()?  openAboutUs,TResult? Function()?  logout,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _OpenEditProfile() when openEditProfile != null:
return openEditProfile(_that.data);case _OpenChangePassword() when openChangePassword != null:
return openChangePassword();case _OpenAboutUs() when openAboutUs != null:
return openAboutUs();case _LogOut() when logout != null:
return logout();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProfileEventState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEventState.initial()';
}


}




/// @nodoc


class _OpenEditProfile implements ProfileEventState {
  const _OpenEditProfile(this.data);
  

 final  UserData data;

/// Create a copy of ProfileEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenEditProfileCopyWith<_OpenEditProfile> get copyWith => __$OpenEditProfileCopyWithImpl<_OpenEditProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenEditProfile&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ProfileEventState.openEditProfile(data: $data)';
}


}

/// @nodoc
abstract mixin class _$OpenEditProfileCopyWith<$Res> implements $ProfileEventStateCopyWith<$Res> {
  factory _$OpenEditProfileCopyWith(_OpenEditProfile value, $Res Function(_OpenEditProfile) _then) = __$OpenEditProfileCopyWithImpl;
@useResult
$Res call({
 UserData data
});


$UserDataCopyWith<$Res> get data;

}
/// @nodoc
class __$OpenEditProfileCopyWithImpl<$Res>
    implements _$OpenEditProfileCopyWith<$Res> {
  __$OpenEditProfileCopyWithImpl(this._self, this._then);

  final _OpenEditProfile _self;
  final $Res Function(_OpenEditProfile) _then;

/// Create a copy of ProfileEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_OpenEditProfile(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserData,
  ));
}

/// Create a copy of ProfileEventState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataCopyWith<$Res> get data {
  
  return $UserDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc


class _OpenChangePassword implements ProfileEventState {
  const _OpenChangePassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenChangePassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEventState.openChangePassword()';
}


}




/// @nodoc


class _OpenAboutUs implements ProfileEventState {
  const _OpenAboutUs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAboutUs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEventState.openAboutUs()';
}


}




/// @nodoc


class _LogOut implements ProfileEventState {
  const _LogOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEventState.logout()';
}


}




// dart format on
