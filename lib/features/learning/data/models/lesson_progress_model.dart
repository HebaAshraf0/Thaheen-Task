import 'package:json_annotation/json_annotation.dart';

part 'lesson_progress_model.g.dart';

@JsonSerializable()
final class LessonProgressModel {
  const LessonProgressModel({
    required this.lessonId,
    required this.positionMilliseconds,
    required this.durationMilliseconds,
    required this.lastWatchedAtMilliseconds,
    required this.isCompleted,
  });

  factory LessonProgressModel.fromJson(Map<String, dynamic> json) =>
      _$LessonProgressModelFromJson(json);

  final String lessonId;
  final int positionMilliseconds;
  final int durationMilliseconds;
  final int lastWatchedAtMilliseconds;
  final bool isCompleted;

  Map<String, dynamic> toJson() => _$LessonProgressModelToJson(this);
}
