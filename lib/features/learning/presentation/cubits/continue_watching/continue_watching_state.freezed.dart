// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'continue_watching_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContinueWatchingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueWatchingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContinueWatchingState()';
}


}

/// @nodoc
class $ContinueWatchingStateCopyWith<$Res>  {
$ContinueWatchingStateCopyWith(ContinueWatchingState _, $Res Function(ContinueWatchingState) __);
}


/// Adds pattern-matching-related methods to [ContinueWatchingState].
extension ContinueWatchingStatePatterns on ContinueWatchingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ContinueWatchingInitial value)?  initial,TResult Function( ContinueWatchingLoading value)?  loading,TResult Function( ContinueWatchingHidden value)?  hidden,TResult Function( ContinueWatchingLoaded value)?  loaded,TResult Function( ContinueWatchingError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ContinueWatchingInitial() when initial != null:
return initial(_that);case ContinueWatchingLoading() when loading != null:
return loading(_that);case ContinueWatchingHidden() when hidden != null:
return hidden(_that);case ContinueWatchingLoaded() when loaded != null:
return loaded(_that);case ContinueWatchingError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ContinueWatchingInitial value)  initial,required TResult Function( ContinueWatchingLoading value)  loading,required TResult Function( ContinueWatchingHidden value)  hidden,required TResult Function( ContinueWatchingLoaded value)  loaded,required TResult Function( ContinueWatchingError value)  error,}){
final _that = this;
switch (_that) {
case ContinueWatchingInitial():
return initial(_that);case ContinueWatchingLoading():
return loading(_that);case ContinueWatchingHidden():
return hidden(_that);case ContinueWatchingLoaded():
return loaded(_that);case ContinueWatchingError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ContinueWatchingInitial value)?  initial,TResult? Function( ContinueWatchingLoading value)?  loading,TResult? Function( ContinueWatchingHidden value)?  hidden,TResult? Function( ContinueWatchingLoaded value)?  loaded,TResult? Function( ContinueWatchingError value)?  error,}){
final _that = this;
switch (_that) {
case ContinueWatchingInitial() when initial != null:
return initial(_that);case ContinueWatchingLoading() when loading != null:
return loading(_that);case ContinueWatchingHidden() when hidden != null:
return hidden(_that);case ContinueWatchingLoaded() when loaded != null:
return loaded(_that);case ContinueWatchingError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  hidden,TResult Function( ContinueWatchingLesson lesson)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ContinueWatchingInitial() when initial != null:
return initial();case ContinueWatchingLoading() when loading != null:
return loading();case ContinueWatchingHidden() when hidden != null:
return hidden();case ContinueWatchingLoaded() when loaded != null:
return loaded(_that.lesson);case ContinueWatchingError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  hidden,required TResult Function( ContinueWatchingLesson lesson)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ContinueWatchingInitial():
return initial();case ContinueWatchingLoading():
return loading();case ContinueWatchingHidden():
return hidden();case ContinueWatchingLoaded():
return loaded(_that.lesson);case ContinueWatchingError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  hidden,TResult? Function( ContinueWatchingLesson lesson)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ContinueWatchingInitial() when initial != null:
return initial();case ContinueWatchingLoading() when loading != null:
return loading();case ContinueWatchingHidden() when hidden != null:
return hidden();case ContinueWatchingLoaded() when loaded != null:
return loaded(_that.lesson);case ContinueWatchingError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ContinueWatchingInitial implements ContinueWatchingState {
  const ContinueWatchingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueWatchingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContinueWatchingState.initial()';
}


}




/// @nodoc


class ContinueWatchingLoading implements ContinueWatchingState {
  const ContinueWatchingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueWatchingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContinueWatchingState.loading()';
}


}




/// @nodoc


class ContinueWatchingHidden implements ContinueWatchingState {
  const ContinueWatchingHidden();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueWatchingHidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContinueWatchingState.hidden()';
}


}




/// @nodoc


class ContinueWatchingLoaded implements ContinueWatchingState {
  const ContinueWatchingLoaded(this.lesson);
  

 final  ContinueWatchingLesson lesson;

/// Create a copy of ContinueWatchingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContinueWatchingLoadedCopyWith<ContinueWatchingLoaded> get copyWith => _$ContinueWatchingLoadedCopyWithImpl<ContinueWatchingLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueWatchingLoaded&&(identical(other.lesson, lesson) || other.lesson == lesson));
}


@override
int get hashCode => Object.hash(runtimeType,lesson);

@override
String toString() {
  return 'ContinueWatchingState.loaded(lesson: $lesson)';
}


}

/// @nodoc
abstract mixin class $ContinueWatchingLoadedCopyWith<$Res> implements $ContinueWatchingStateCopyWith<$Res> {
  factory $ContinueWatchingLoadedCopyWith(ContinueWatchingLoaded value, $Res Function(ContinueWatchingLoaded) _then) = _$ContinueWatchingLoadedCopyWithImpl;
@useResult
$Res call({
 ContinueWatchingLesson lesson
});




}
/// @nodoc
class _$ContinueWatchingLoadedCopyWithImpl<$Res>
    implements $ContinueWatchingLoadedCopyWith<$Res> {
  _$ContinueWatchingLoadedCopyWithImpl(this._self, this._then);

  final ContinueWatchingLoaded _self;
  final $Res Function(ContinueWatchingLoaded) _then;

/// Create a copy of ContinueWatchingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lesson = null,}) {
  return _then(ContinueWatchingLoaded(
null == lesson ? _self.lesson : lesson // ignore: cast_nullable_to_non_nullable
as ContinueWatchingLesson,
  ));
}


}

/// @nodoc


class ContinueWatchingError implements ContinueWatchingState {
  const ContinueWatchingError(this.message);
  

 final  String message;

/// Create a copy of ContinueWatchingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContinueWatchingErrorCopyWith<ContinueWatchingError> get copyWith => _$ContinueWatchingErrorCopyWithImpl<ContinueWatchingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueWatchingError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ContinueWatchingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ContinueWatchingErrorCopyWith<$Res> implements $ContinueWatchingStateCopyWith<$Res> {
  factory $ContinueWatchingErrorCopyWith(ContinueWatchingError value, $Res Function(ContinueWatchingError) _then) = _$ContinueWatchingErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ContinueWatchingErrorCopyWithImpl<$Res>
    implements $ContinueWatchingErrorCopyWith<$Res> {
  _$ContinueWatchingErrorCopyWithImpl(this._self, this._then);

  final ContinueWatchingError _self;
  final $Res Function(ContinueWatchingError) _then;

/// Create a copy of ContinueWatchingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ContinueWatchingError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
