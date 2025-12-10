// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MainEvent()';
}


}

/// @nodoc
class $MainEventCopyWith<$Res>  {
$MainEventCopyWith(MainEvent _, $Res Function(MainEvent) __);
}


/// Adds pattern-matching-related methods to [MainEvent].
extension MainEventPatterns on MainEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _OpenTypeBottomSheet value)?  openTypeBottomSheet,TResult Function( _TypeBottomSheetResult value)?  typeBottomSheetResult,TResult Function( _OpenAvaibilityBottomSheet value)?  openAvaibilityBottomSheet,TResult Function( _AvaibilityBottomSheetResult value)?  avaibilityBottomSheetResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenTypeBottomSheet() when openTypeBottomSheet != null:
return openTypeBottomSheet(_that);case _TypeBottomSheetResult() when typeBottomSheetResult != null:
return typeBottomSheetResult(_that);case _OpenAvaibilityBottomSheet() when openAvaibilityBottomSheet != null:
return openAvaibilityBottomSheet(_that);case _AvaibilityBottomSheetResult() when avaibilityBottomSheetResult != null:
return avaibilityBottomSheetResult(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _OpenTypeBottomSheet value)  openTypeBottomSheet,required TResult Function( _TypeBottomSheetResult value)  typeBottomSheetResult,required TResult Function( _OpenAvaibilityBottomSheet value)  openAvaibilityBottomSheet,required TResult Function( _AvaibilityBottomSheetResult value)  avaibilityBottomSheetResult,}){
final _that = this;
switch (_that) {
case _OpenTypeBottomSheet():
return openTypeBottomSheet(_that);case _TypeBottomSheetResult():
return typeBottomSheetResult(_that);case _OpenAvaibilityBottomSheet():
return openAvaibilityBottomSheet(_that);case _AvaibilityBottomSheetResult():
return avaibilityBottomSheetResult(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _OpenTypeBottomSheet value)?  openTypeBottomSheet,TResult? Function( _TypeBottomSheetResult value)?  typeBottomSheetResult,TResult? Function( _OpenAvaibilityBottomSheet value)?  openAvaibilityBottomSheet,TResult? Function( _AvaibilityBottomSheetResult value)?  avaibilityBottomSheetResult,}){
final _that = this;
switch (_that) {
case _OpenTypeBottomSheet() when openTypeBottomSheet != null:
return openTypeBottomSheet(_that);case _TypeBottomSheetResult() when typeBottomSheetResult != null:
return typeBottomSheetResult(_that);case _OpenAvaibilityBottomSheet() when openAvaibilityBottomSheet != null:
return openAvaibilityBottomSheet(_that);case _AvaibilityBottomSheetResult() when avaibilityBottomSheetResult != null:
return avaibilityBottomSheetResult(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? currentType)?  openTypeBottomSheet,TResult Function( String type)?  typeBottomSheetResult,TResult Function( List<AvaiblityItem> item)?  openAvaibilityBottomSheet,TResult Function( AvaiblityItem item)?  avaibilityBottomSheetResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenTypeBottomSheet() when openTypeBottomSheet != null:
return openTypeBottomSheet(_that.currentType);case _TypeBottomSheetResult() when typeBottomSheetResult != null:
return typeBottomSheetResult(_that.type);case _OpenAvaibilityBottomSheet() when openAvaibilityBottomSheet != null:
return openAvaibilityBottomSheet(_that.item);case _AvaibilityBottomSheetResult() when avaibilityBottomSheetResult != null:
return avaibilityBottomSheetResult(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? currentType)  openTypeBottomSheet,required TResult Function( String type)  typeBottomSheetResult,required TResult Function( List<AvaiblityItem> item)  openAvaibilityBottomSheet,required TResult Function( AvaiblityItem item)  avaibilityBottomSheetResult,}) {final _that = this;
switch (_that) {
case _OpenTypeBottomSheet():
return openTypeBottomSheet(_that.currentType);case _TypeBottomSheetResult():
return typeBottomSheetResult(_that.type);case _OpenAvaibilityBottomSheet():
return openAvaibilityBottomSheet(_that.item);case _AvaibilityBottomSheetResult():
return avaibilityBottomSheetResult(_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? currentType)?  openTypeBottomSheet,TResult? Function( String type)?  typeBottomSheetResult,TResult? Function( List<AvaiblityItem> item)?  openAvaibilityBottomSheet,TResult? Function( AvaiblityItem item)?  avaibilityBottomSheetResult,}) {final _that = this;
switch (_that) {
case _OpenTypeBottomSheet() when openTypeBottomSheet != null:
return openTypeBottomSheet(_that.currentType);case _TypeBottomSheetResult() when typeBottomSheetResult != null:
return typeBottomSheetResult(_that.type);case _OpenAvaibilityBottomSheet() when openAvaibilityBottomSheet != null:
return openAvaibilityBottomSheet(_that.item);case _AvaibilityBottomSheetResult() when avaibilityBottomSheetResult != null:
return avaibilityBottomSheetResult(_that.item);case _:
  return null;

}
}

}

/// @nodoc


class _OpenTypeBottomSheet implements MainEvent {
  const _OpenTypeBottomSheet(this.currentType);
  

 final  String? currentType;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenTypeBottomSheetCopyWith<_OpenTypeBottomSheet> get copyWith => __$OpenTypeBottomSheetCopyWithImpl<_OpenTypeBottomSheet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenTypeBottomSheet&&(identical(other.currentType, currentType) || other.currentType == currentType));
}


@override
int get hashCode => Object.hash(runtimeType,currentType);

@override
String toString() {
  return 'MainEvent.openTypeBottomSheet(currentType: $currentType)';
}


}

/// @nodoc
abstract mixin class _$OpenTypeBottomSheetCopyWith<$Res> implements $MainEventCopyWith<$Res> {
  factory _$OpenTypeBottomSheetCopyWith(_OpenTypeBottomSheet value, $Res Function(_OpenTypeBottomSheet) _then) = __$OpenTypeBottomSheetCopyWithImpl;
@useResult
$Res call({
 String? currentType
});




}
/// @nodoc
class __$OpenTypeBottomSheetCopyWithImpl<$Res>
    implements _$OpenTypeBottomSheetCopyWith<$Res> {
  __$OpenTypeBottomSheetCopyWithImpl(this._self, this._then);

  final _OpenTypeBottomSheet _self;
  final $Res Function(_OpenTypeBottomSheet) _then;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentType = freezed,}) {
  return _then(_OpenTypeBottomSheet(
freezed == currentType ? _self.currentType : currentType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _TypeBottomSheetResult implements MainEvent {
  const _TypeBottomSheetResult(this.type);
  

 final  String type;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeBottomSheetResultCopyWith<_TypeBottomSheetResult> get copyWith => __$TypeBottomSheetResultCopyWithImpl<_TypeBottomSheetResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeBottomSheetResult&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'MainEvent.typeBottomSheetResult(type: $type)';
}


}

/// @nodoc
abstract mixin class _$TypeBottomSheetResultCopyWith<$Res> implements $MainEventCopyWith<$Res> {
  factory _$TypeBottomSheetResultCopyWith(_TypeBottomSheetResult value, $Res Function(_TypeBottomSheetResult) _then) = __$TypeBottomSheetResultCopyWithImpl;
@useResult
$Res call({
 String type
});




}
/// @nodoc
class __$TypeBottomSheetResultCopyWithImpl<$Res>
    implements _$TypeBottomSheetResultCopyWith<$Res> {
  __$TypeBottomSheetResultCopyWithImpl(this._self, this._then);

  final _TypeBottomSheetResult _self;
  final $Res Function(_TypeBottomSheetResult) _then;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_TypeBottomSheetResult(
null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OpenAvaibilityBottomSheet implements MainEvent {
  const _OpenAvaibilityBottomSheet(final  List<AvaiblityItem> item): _item = item;
  

 final  List<AvaiblityItem> _item;
 List<AvaiblityItem> get item {
  if (_item is EqualUnmodifiableListView) return _item;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_item);
}


/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenAvaibilityBottomSheetCopyWith<_OpenAvaibilityBottomSheet> get copyWith => __$OpenAvaibilityBottomSheetCopyWithImpl<_OpenAvaibilityBottomSheet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAvaibilityBottomSheet&&const DeepCollectionEquality().equals(other._item, _item));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_item));

@override
String toString() {
  return 'MainEvent.openAvaibilityBottomSheet(item: $item)';
}


}

/// @nodoc
abstract mixin class _$OpenAvaibilityBottomSheetCopyWith<$Res> implements $MainEventCopyWith<$Res> {
  factory _$OpenAvaibilityBottomSheetCopyWith(_OpenAvaibilityBottomSheet value, $Res Function(_OpenAvaibilityBottomSheet) _then) = __$OpenAvaibilityBottomSheetCopyWithImpl;
@useResult
$Res call({
 List<AvaiblityItem> item
});




}
/// @nodoc
class __$OpenAvaibilityBottomSheetCopyWithImpl<$Res>
    implements _$OpenAvaibilityBottomSheetCopyWith<$Res> {
  __$OpenAvaibilityBottomSheetCopyWithImpl(this._self, this._then);

  final _OpenAvaibilityBottomSheet _self;
  final $Res Function(_OpenAvaibilityBottomSheet) _then;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_OpenAvaibilityBottomSheet(
null == item ? _self._item : item // ignore: cast_nullable_to_non_nullable
as List<AvaiblityItem>,
  ));
}


}

/// @nodoc


class _AvaibilityBottomSheetResult implements MainEvent {
  const _AvaibilityBottomSheetResult(this.item);
  

 final  AvaiblityItem item;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvaibilityBottomSheetResultCopyWith<_AvaibilityBottomSheetResult> get copyWith => __$AvaibilityBottomSheetResultCopyWithImpl<_AvaibilityBottomSheetResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvaibilityBottomSheetResult&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'MainEvent.avaibilityBottomSheetResult(item: $item)';
}


}

/// @nodoc
abstract mixin class _$AvaibilityBottomSheetResultCopyWith<$Res> implements $MainEventCopyWith<$Res> {
  factory _$AvaibilityBottomSheetResultCopyWith(_AvaibilityBottomSheetResult value, $Res Function(_AvaibilityBottomSheetResult) _then) = __$AvaibilityBottomSheetResultCopyWithImpl;
@useResult
$Res call({
 AvaiblityItem item
});




}
/// @nodoc
class __$AvaibilityBottomSheetResultCopyWithImpl<$Res>
    implements _$AvaibilityBottomSheetResultCopyWith<$Res> {
  __$AvaibilityBottomSheetResultCopyWithImpl(this._self, this._then);

  final _AvaibilityBottomSheetResult _self;
  final $Res Function(_AvaibilityBottomSheetResult) _then;

/// Create a copy of MainEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_AvaibilityBottomSheetResult(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as AvaiblityItem,
  ));
}


}

// dart format on
