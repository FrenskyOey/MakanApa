// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEventState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEventState()';
}


}

/// @nodoc
class $HomeEventStateCopyWith<$Res>  {
$HomeEventStateCopyWith(HomeEventState _, $Res Function(HomeEventState) __);
}


/// Adds pattern-matching-related methods to [HomeEventState].
extension HomeEventStatePatterns on HomeEventState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToastError value)?  toastError,TResult Function( _ToastSuccess value)?  toastSuccess,TResult Function( _OpenCreatePlan value)?  openCreatePlan,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that);case _OpenCreatePlan() when openCreatePlan != null:
return openCreatePlan(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToastError value)  toastError,required TResult Function( _ToastSuccess value)  toastSuccess,required TResult Function( _OpenCreatePlan value)  openCreatePlan,}){
final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that);case _ToastSuccess():
return toastSuccess(_that);case _OpenCreatePlan():
return openCreatePlan(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToastError value)?  toastError,TResult? Function( _ToastSuccess value)?  toastSuccess,TResult? Function( _OpenCreatePlan value)?  openCreatePlan,}){
final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that);case _OpenCreatePlan() when openCreatePlan != null:
return openCreatePlan(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  toastError,TResult Function( String message)?  toastSuccess,TResult Function( AvaiblityItem item)?  openCreatePlan,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.message);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that.message);case _OpenCreatePlan() when openCreatePlan != null:
return openCreatePlan(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  toastError,required TResult Function( String message)  toastSuccess,required TResult Function( AvaiblityItem item)  openCreatePlan,}) {final _that = this;
switch (_that) {
case _ToastError():
return toastError(_that.message);case _ToastSuccess():
return toastSuccess(_that.message);case _OpenCreatePlan():
return openCreatePlan(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  toastError,TResult? Function( String message)?  toastSuccess,TResult? Function( AvaiblityItem item)?  openCreatePlan,}) {final _that = this;
switch (_that) {
case _ToastError() when toastError != null:
return toastError(_that.message);case _ToastSuccess() when toastSuccess != null:
return toastSuccess(_that.message);case _OpenCreatePlan() when openCreatePlan != null:
return openCreatePlan(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _ToastError implements HomeEventState {
  const _ToastError(this.message);
  

 final  String message;

/// Create a copy of HomeEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToastErrorCopyWith<_ToastError> get copyWith => __$ToastErrorCopyWithImpl<_ToastError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToastError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeEventState.toastError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ToastErrorCopyWith<$Res> implements $HomeEventStateCopyWith<$Res> {
  factory _$ToastErrorCopyWith(_ToastError value, $Res Function(_ToastError) _then) = __$ToastErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ToastErrorCopyWithImpl<$Res>
    implements _$ToastErrorCopyWith<$Res> {
  __$ToastErrorCopyWithImpl(this._self, this._then);

  final _ToastError _self;
  final $Res Function(_ToastError) _then;

/// Create a copy of HomeEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ToastError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToastSuccess implements HomeEventState {
  const _ToastSuccess(this.message);
  

 final  String message;

/// Create a copy of HomeEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToastSuccessCopyWith<_ToastSuccess> get copyWith => __$ToastSuccessCopyWithImpl<_ToastSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToastSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeEventState.toastSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ToastSuccessCopyWith<$Res> implements $HomeEventStateCopyWith<$Res> {
  factory _$ToastSuccessCopyWith(_ToastSuccess value, $Res Function(_ToastSuccess) _then) = __$ToastSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ToastSuccessCopyWithImpl<$Res>
    implements _$ToastSuccessCopyWith<$Res> {
  __$ToastSuccessCopyWithImpl(this._self, this._then);

  final _ToastSuccess _self;
  final $Res Function(_ToastSuccess) _then;

/// Create a copy of HomeEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ToastSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OpenCreatePlan implements HomeEventState {
  const _OpenCreatePlan(this.item);
  

 final  AvaiblityItem item;

/// Create a copy of HomeEventState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenCreatePlanCopyWith<_OpenCreatePlan> get copyWith => __$OpenCreatePlanCopyWithImpl<_OpenCreatePlan>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenCreatePlan&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'HomeEventState.openCreatePlan(item: $item)';
}


}

/// @nodoc
abstract mixin class _$OpenCreatePlanCopyWith<$Res> implements $HomeEventStateCopyWith<$Res> {
  factory _$OpenCreatePlanCopyWith(_OpenCreatePlan value, $Res Function(_OpenCreatePlan) _then) = __$OpenCreatePlanCopyWithImpl;
@useResult
$Res call({
 AvaiblityItem item
});




}
/// @nodoc
class __$OpenCreatePlanCopyWithImpl<$Res>
    implements _$OpenCreatePlanCopyWith<$Res> {
  __$OpenCreatePlanCopyWithImpl(this._self, this._then);

  final _OpenCreatePlan _self;
  final $Res Function(_OpenCreatePlan) _then;

/// Create a copy of HomeEventState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_OpenCreatePlan(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AvaiblityItem,
  ));
}


}

// dart format on
