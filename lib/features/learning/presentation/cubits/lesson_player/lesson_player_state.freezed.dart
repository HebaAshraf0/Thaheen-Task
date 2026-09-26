// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonPlayerState {

 LessonProgress? get progress; LessonProgress? get latestSavedProgress; bool get isSaving; String? get errorMessage;
/// Create a copy of LessonPlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonPlayerStateCopyWith<LessonPlayerState> get copyWith => _$LessonPlayerStateCopyWithImpl<LessonPlayerState>(this as LessonPlayerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonPlayerState&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.latestSavedProgress, latestSavedProgress) || other.latestSavedProgress == latestSavedProgress)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,progress,latestSavedProgress,isSaving,errorMessage);

@override
String toString() {
  return 'LessonPlayerState(progress: $progress, latestSavedProgress: $latestSavedProgress, isSaving: $isSaving, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LessonPlayerStateCopyWith<$Res>  {
  factory $LessonPlayerStateCopyWith(LessonPlayerState value, $Res Function(LessonPlayerState) _then) = _$LessonPlayerStateCopyWithImpl;
@useResult
$Res call({
 LessonProgress? progress, LessonProgress? latestSavedProgress, bool isSaving, String? errorMessage
});




}
/// @nodoc
class _$LessonPlayerStateCopyWithImpl<$Res>
    implements $LessonPlayerStateCopyWith<$Res> {
  _$LessonPlayerStateCopyWithImpl(this._self, this._then);

  final LessonPlayerState _self;
  final $Res Function(LessonPlayerState) _then;

/// Create a copy of LessonPlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progress = freezed,Object? latestSavedProgress = freezed,Object? isSaving = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as LessonProgress?,latestSavedProgress: freezed == latestSavedProgress ? _self.latestSavedProgress : latestSavedProgress // ignore: cast_nullable_to_non_nullable
as LessonProgress?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonPlayerState].
extension LessonPlayerStatePatterns on LessonPlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonPlayerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonPlayerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonPlayerState value)  $default,){
final _that = this;
switch (_that) {
case _LessonPlayerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonPlayerState value)?  $default,){
final _that = this;
switch (_that) {
case _LessonPlayerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LessonProgress? progress,  LessonProgress? latestSavedProgress,  bool isSaving,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonPlayerState() when $default != null:
return $default(_that.progress,_that.latestSavedProgress,_that.isSaving,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LessonProgress? progress,  LessonProgress? latestSavedProgress,  bool isSaving,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LessonPlayerState():
return $default(_that.progress,_that.latestSavedProgress,_that.isSaving,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LessonProgress? progress,  LessonProgress? latestSavedProgress,  bool isSaving,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LessonPlayerState() when $default != null:
return $default(_that.progress,_that.latestSavedProgress,_that.isSaving,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LessonPlayerState implements LessonPlayerState {
  const _LessonPlayerState({this.progress, this.latestSavedProgress, this.isSaving = false, this.errorMessage});
  

@override final  LessonProgress? progress;
@override final  LessonProgress? latestSavedProgress;
@override@JsonKey() final  bool isSaving;
@override final  String? errorMessage;

/// Create a copy of LessonPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonPlayerStateCopyWith<_LessonPlayerState> get copyWith => __$LessonPlayerStateCopyWithImpl<_LessonPlayerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonPlayerState&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.latestSavedProgress, latestSavedProgress) || other.latestSavedProgress == latestSavedProgress)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,progress,latestSavedProgress,isSaving,errorMessage);

@override
String toString() {
  return 'LessonPlayerState(progress: $progress, latestSavedProgress: $latestSavedProgress, isSaving: $isSaving, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LessonPlayerStateCopyWith<$Res> implements $LessonPlayerStateCopyWith<$Res> {
  factory _$LessonPlayerStateCopyWith(_LessonPlayerState value, $Res Function(_LessonPlayerState) _then) = __$LessonPlayerStateCopyWithImpl;
@override @useResult
$Res call({
 LessonProgress? progress, LessonProgress? latestSavedProgress, bool isSaving, String? errorMessage
});




}
/// @nodoc
class __$LessonPlayerStateCopyWithImpl<$Res>
    implements _$LessonPlayerStateCopyWith<$Res> {
  __$LessonPlayerStateCopyWithImpl(this._self, this._then);

  final _LessonPlayerState _self;
  final $Res Function(_LessonPlayerState) _then;

/// Create a copy of LessonPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progress = freezed,Object? latestSavedProgress = freezed,Object? isSaving = null,Object? errorMessage = freezed,}) {
  return _then(_LessonPlayerState(
progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as LessonProgress?,latestSavedProgress: freezed == latestSavedProgress ? _self.latestSavedProgress : latestSavedProgress // ignore: cast_nullable_to_non_nullable
as LessonProgress?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
