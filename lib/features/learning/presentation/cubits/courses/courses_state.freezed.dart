// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'courses_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoursesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoursesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CoursesState()';
}


}

/// @nodoc
class $CoursesStateCopyWith<$Res>  {
$CoursesStateCopyWith(CoursesState _, $Res Function(CoursesState) __);
}


/// Adds pattern-matching-related methods to [CoursesState].
extension CoursesStatePatterns on CoursesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CoursesInitial value)?  initial,TResult Function( CoursesLoading value)?  loading,TResult Function( CoursesEmpty value)?  empty,TResult Function( CoursesLoaded value)?  loaded,TResult Function( CoursesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CoursesInitial() when initial != null:
return initial(_that);case CoursesLoading() when loading != null:
return loading(_that);case CoursesEmpty() when empty != null:
return empty(_that);case CoursesLoaded() when loaded != null:
return loaded(_that);case CoursesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CoursesInitial value)  initial,required TResult Function( CoursesLoading value)  loading,required TResult Function( CoursesEmpty value)  empty,required TResult Function( CoursesLoaded value)  loaded,required TResult Function( CoursesError value)  error,}){
final _that = this;
switch (_that) {
case CoursesInitial():
return initial(_that);case CoursesLoading():
return loading(_that);case CoursesEmpty():
return empty(_that);case CoursesLoaded():
return loaded(_that);case CoursesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CoursesInitial value)?  initial,TResult? Function( CoursesLoading value)?  loading,TResult? Function( CoursesEmpty value)?  empty,TResult? Function( CoursesLoaded value)?  loaded,TResult? Function( CoursesError value)?  error,}){
final _that = this;
switch (_that) {
case CoursesInitial() when initial != null:
return initial(_that);case CoursesLoading() when loading != null:
return loading(_that);case CoursesEmpty() when empty != null:
return empty(_that);case CoursesLoaded() when loaded != null:
return loaded(_that);case CoursesError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  empty,TResult Function( List<Course> courses,  Map<String, double> progressByCourseId)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CoursesInitial() when initial != null:
return initial();case CoursesLoading() when loading != null:
return loading();case CoursesEmpty() when empty != null:
return empty();case CoursesLoaded() when loaded != null:
return loaded(_that.courses,_that.progressByCourseId);case CoursesError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  empty,required TResult Function( List<Course> courses,  Map<String, double> progressByCourseId)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CoursesInitial():
return initial();case CoursesLoading():
return loading();case CoursesEmpty():
return empty();case CoursesLoaded():
return loaded(_that.courses,_that.progressByCourseId);case CoursesError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  empty,TResult? Function( List<Course> courses,  Map<String, double> progressByCourseId)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CoursesInitial() when initial != null:
return initial();case CoursesLoading() when loading != null:
return loading();case CoursesEmpty() when empty != null:
return empty();case CoursesLoaded() when loaded != null:
return loaded(_that.courses,_that.progressByCourseId);case CoursesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CoursesInitial implements CoursesState {
  const CoursesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoursesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CoursesState.initial()';
}


}




/// @nodoc


class CoursesLoading implements CoursesState {
  const CoursesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoursesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CoursesState.loading()';
}


}




/// @nodoc


class CoursesEmpty implements CoursesState {
  const CoursesEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoursesEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CoursesState.empty()';
}


}




/// @nodoc


class CoursesLoaded implements CoursesState {
  const CoursesLoaded(final  List<Course> courses, final  Map<String, double> progressByCourseId): _courses = courses,_progressByCourseId = progressByCourseId;
  

 final  List<Course> _courses;
 List<Course> get courses {
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courses);
}

 final  Map<String, double> _progressByCourseId;
 Map<String, double> get progressByCourseId {
  if (_progressByCourseId is EqualUnmodifiableMapView) return _progressByCourseId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_progressByCourseId);
}


/// Create a copy of CoursesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoursesLoadedCopyWith<CoursesLoaded> get copyWith => _$CoursesLoadedCopyWithImpl<CoursesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoursesLoaded&&const DeepCollectionEquality().equals(other._courses, _courses)&&const DeepCollectionEquality().equals(other._progressByCourseId, _progressByCourseId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_courses),const DeepCollectionEquality().hash(_progressByCourseId));

@override
String toString() {
  return 'CoursesState.loaded(courses: $courses, progressByCourseId: $progressByCourseId)';
}


}

/// @nodoc
abstract mixin class $CoursesLoadedCopyWith<$Res> implements $CoursesStateCopyWith<$Res> {
  factory $CoursesLoadedCopyWith(CoursesLoaded value, $Res Function(CoursesLoaded) _then) = _$CoursesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Course> courses, Map<String, double> progressByCourseId
});




}
/// @nodoc
class _$CoursesLoadedCopyWithImpl<$Res>
    implements $CoursesLoadedCopyWith<$Res> {
  _$CoursesLoadedCopyWithImpl(this._self, this._then);

  final CoursesLoaded _self;
  final $Res Function(CoursesLoaded) _then;

/// Create a copy of CoursesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courses = null,Object? progressByCourseId = null,}) {
  return _then(CoursesLoaded(
null == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<Course>,null == progressByCourseId ? _self._progressByCourseId : progressByCourseId // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

/// @nodoc


class CoursesError implements CoursesState {
  const CoursesError(this.message);
  

 final  String message;

/// Create a copy of CoursesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoursesErrorCopyWith<CoursesError> get copyWith => _$CoursesErrorCopyWithImpl<CoursesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoursesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CoursesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CoursesErrorCopyWith<$Res> implements $CoursesStateCopyWith<$Res> {
  factory $CoursesErrorCopyWith(CoursesError value, $Res Function(CoursesError) _then) = _$CoursesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CoursesErrorCopyWithImpl<$Res>
    implements $CoursesErrorCopyWith<$Res> {
  _$CoursesErrorCopyWithImpl(this._self, this._then);

  final CoursesError _self;
  final $Res Function(CoursesError) _then;

/// Create a copy of CoursesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CoursesError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
