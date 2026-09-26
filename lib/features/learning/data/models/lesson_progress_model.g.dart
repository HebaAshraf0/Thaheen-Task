// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonProgressModel _$LessonProgressModelFromJson(Map<String, dynamic> json) =>
    LessonProgressModel(
      courseId: json['courseId'] as String? ?? '',
      lessonId: json['lessonId'] as String,
      positionMilliseconds: (json['positionMilliseconds'] as num).toInt(),
      durationMilliseconds: (json['durationMilliseconds'] as num).toInt(),
      lastWatchedAtMilliseconds: (json['lastWatchedAtMilliseconds'] as num)
          .toInt(),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$LessonProgressModelToJson(
  LessonProgressModel instance,
) => <String, dynamic>{
  'courseId': instance.courseId,
  'lessonId': instance.lessonId,
  'positionMilliseconds': instance.positionMilliseconds,
  'durationMilliseconds': instance.durationMilliseconds,
  'lastWatchedAtMilliseconds': instance.lastWatchedAtMilliseconds,
  'isCompleted': instance.isCompleted,
};
