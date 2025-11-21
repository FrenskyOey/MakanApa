// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TokenState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TokenState()';
}


}

/// @nodoc
class $TokenStateCopyWith<$Res>  {
$TokenStateCopyWith(TokenState _, $Res Function(TokenState) __);
}


/// Adds pattern-matching-related methods to [TokenState].
extension TokenStatePatterns on TokenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialState value)?  initialState,TResult Function( _LoginState value)?  loginState,TResult Function( _LogoutState value)?  logoutState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialState() when initialState != null:
return initialState(_that);case _LoginState() when loginState != null:
return loginState(_that);case _LogoutState() when logoutState != null:
return logoutState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialState value)  initialState,required TResult Function( _LoginState value)  loginState,required TResult Function( _LogoutState value)  logoutState,}){
final _that = this;
switch (_that) {
case _InitialState():
return initialState(_that);case _LoginState():
return loginState(_that);case _LogoutState():
return logoutState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialState value)?  initialState,TResult? Function( _LoginState value)?  loginState,TResult? Function( _LogoutState value)?  logoutState,}){
final _that = this;
switch (_that) {
case _InitialState() when initialState != null:
return initialState(_that);case _LoginState() when loginState != null:
return loginState(_that);case _LogoutState() when logoutState != null:
return logoutState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initialState,TResult Function( String token)?  loginState,TResult Function()?  logoutState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialState() when initialState != null:
return initialState();case _LoginState() when loginState != null:
return loginState(_that.token);case _LogoutState() when logoutState != null:
return logoutState();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initialState,required TResult Function( String token)  loginState,required TResult Function()  logoutState,}) {final _that = this;
switch (_that) {
case _InitialState():
return initialState();case _LoginState():
return loginState(_that.token);case _LogoutState():
return logoutState();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initialState,TResult? Function( String token)?  loginState,TResult? Function()?  logoutState,}) {final _that = this;
switch (_that) {
case _InitialState() when initialState != null:
return initialState();case _LoginState() when loginState != null:
return loginState(_that.token);case _LogoutState() when logoutState != null:
return logoutState();case _:
  return null;

}
}

}

/// @nodoc


class _InitialState implements TokenState {
  const _InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TokenState.initialState()';
}


}




/// @nodoc


class _LoginState implements TokenState {
  const _LoginState(this.token);
  

 final  String token;

/// Create a copy of TokenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'TokenState.loginState(token: $token)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $TokenStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of TokenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_LoginState(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LogoutState implements TokenState {
  const _LogoutState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TokenState.logoutState()';
}


}




// dart format on
