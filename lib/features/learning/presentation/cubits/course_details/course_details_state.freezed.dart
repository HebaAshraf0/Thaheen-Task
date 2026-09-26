// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseDetailsState()';
}


}

/// @nodoc
class $CourseDetailsStateCopyWith<$Res>  {
$CourseDetailsStateCopyWith(CourseDetailsState _, $Res Function(CourseDetailsState) __);
}


/// Adds pattern-matching-related methods to [CourseDetailsState].
extension CourseDetailsStatePatterns on CourseDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CourseDetailsInitial value)?  initial,TResult Function( CourseDetailsLoading value)?  loading,TResult Function( CourseDetailsLoaded value)?  loaded,TResult Function( CourseDetailsNotFound value)?  notFound,TResult Function( CourseDetailsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CourseDetailsInitial() when initial != null:
return initial(_that);case CourseDetailsLoading() when loading != null:
return loading(_that);case CourseDetailsLoaded() when loaded != null:
return loaded(_that);case CourseDetailsNotFound() when notFound != null:
return notFound(_that);case CourseDetailsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CourseDetailsInitial value)  initial,required TResult Function( CourseDetailsLoading value)  loading,required TResult Function( CourseDetailsLoaded value)  loaded,required TResult Function( CourseDetailsNotFound value)  notFound,required TResult Function( CourseDetailsError value)  error,}){
final _that = this;
switch (_that) {
case CourseDetailsInitial():
return initial(_that);case CourseDetailsLoading():
return loading(_that);case CourseDetailsLoaded():
return loaded(_that);case CourseDetailsNotFound():
return notFound(_that);case CourseDetailsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CourseDetailsInitial value)?  initial,TResult? Function( CourseDetailsLoading value)?  loading,TResult? Function( CourseDetailsLoaded value)?  loaded,TResult? Function( CourseDetailsNotFound value)?  notFound,TResult? Function( CourseDetailsError value)?  error,}){
final _that = this;
switch (_that) {
case CourseDetailsInitial() when initial != null:
return initial(_that);case CourseDetailsLoading() when loading != null:
return loading(_that);case CourseDetailsLoaded() when loaded != null:
return loaded(_that);case CourseDetailsNotFound() when notFound != null:
return notFound(_that);case CourseDetailsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Course course,  Map<String, LessonProgress> progressByLessonId)?  loaded,TResult Function()?  notFound,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CourseDetailsInitial() when initial != null:
return initial();case CourseDetailsLoading() when loading != null:
return loading();case CourseDetailsLoaded() when loaded != null:
return loaded(_that.course,_that.progressByLessonId);case CourseDetailsNotFound() when notFound != null:
return notFound();case CourseDetailsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Course course,  Map<String, LessonProgress> progressByLessonId)  loaded,required TResult Function()  notFound,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CourseDetailsInitial():
return initial();case CourseDetailsLoading():
return loading();case CourseDetailsLoaded():
return loaded(_that.course,_that.progressByLessonId);case CourseDetailsNotFound():
return notFound();case CourseDetailsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Course course,  Map<String, LessonProgress> progressByLessonId)?  loaded,TResult? Function()?  notFound,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CourseDetailsInitial() when initial != null:
return initial();case CourseDetailsLoading() when loading != null:
return loading();case CourseDetailsLoaded() when loaded != null:
return loaded(_that.course,_that.progressByLessonId);case CourseDetailsNotFound() when notFound != null:
return notFound();case CourseDetailsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CourseDetailsInitial implements CourseDetailsState {
  const CourseDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseDetailsState.initial()';
}


}




/// @nodoc


class CourseDetailsLoading implements CourseDetailsState {
  const CourseDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseDetailsState.loading()';
}


}




/// @nodoc


class CourseDetailsLoaded implements CourseDetailsState {
  const CourseDetailsLoaded(this.course, final  Map<String, LessonProgress> progressByLessonId): _progressByLessonId = progressByLessonId;
  

 final  Course course;
 final  Map<String, LessonProgress> _progressByLessonId;
 Map<String, LessonProgress> get progressByLessonId {
  if (_progressByLessonId is EqualUnmodifiableMapView) return _progressByLessonId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_progressByLessonId);
}


/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseDetailsLoadedCopyWith<CourseDetailsLoaded> get copyWith => _$CourseDetailsLoadedCopyWithImpl<CourseDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetailsLoaded&&(identical(other.course, course) || other.course == course)&&const DeepCollectionEquality().equals(other._progressByLessonId, _progressByLessonId));
}


@override
int get hashCode => Object.hash(runtimeType,course,const DeepCollectionEquality().hash(_progressByLessonId));

@override
String toString() {
  return 'CourseDetailsState.loaded(course: $course, progressByLessonId: $progressByLessonId)';
}


}

/// @nodoc
abstract mixin class $CourseDetailsLoadedCopyWith<$Res> implements $CourseDetailsStateCopyWith<$Res> {
  factory $CourseDetailsLoadedCopyWith(CourseDetailsLoaded value, $Res Function(CourseDetailsLoaded) _then) = _$CourseDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 Course course, Map<String, LessonProgress> progressByLessonId
});




}
/// @nodoc
class _$CourseDetailsLoadedCopyWithImpl<$Res>
    implements $CourseDetailsLoadedCopyWith<$Res> {
  _$CourseDetailsLoadedCopyWithImpl(this._self, this._then);

  final CourseDetailsLoaded _self;
  final $Res Function(CourseDetailsLoaded) _then;

/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? course = null,Object? progressByLessonId = null,}) {
  return _then(CourseDetailsLoaded(
null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as Course,null == progressByLessonId ? _self._progressByLessonId : progressByLessonId // ignore: cast_nullable_to_non_nullable
as Map<String, LessonProgress>,
  ));
}


}

/// @nodoc


class CourseDetailsNotFound implements CourseDetailsState {
  const CourseDetailsNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetailsNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CourseDetailsState.notFound()';
}


}




/// @nodoc


class CourseDetailsError implements CourseDetailsState {
  const CourseDetailsError(this.message);
  

 final  String message;

/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseDetailsErrorCopyWith<CourseDetailsError> get copyWith => _$CourseDetailsErrorCopyWithImpl<CourseDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseDetailsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CourseDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CourseDetailsErrorCopyWith<$Res> implements $CourseDetailsStateCopyWith<$Res> {
  factory $CourseDetailsErrorCopyWith(CourseDetailsError value, $Res Function(CourseDetailsError) _then) = _$CourseDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CourseDetailsErrorCopyWithImpl<$Res>
    implements $CourseDetailsErrorCopyWith<$Res> {
  _$CourseDetailsErrorCopyWithImpl(this._self, this._then);

  final CourseDetailsError _self;
  final $Res Function(CourseDetailsError) _then;

/// Create a copy of CourseDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CourseDetailsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
