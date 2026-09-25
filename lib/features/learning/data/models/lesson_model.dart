import 'package:json_annotation/json_annotation.dart';

part 'lesson_model.g.dart';

@JsonSerializable()
final class LessonModel {
  const LessonModel({
    required this.id,
    required this.title,
    required this.durationSeconds,
    required this.videoAssetPath,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  final String id;
  final String title;
  final int durationSeconds;

  @JsonKey(name: 'videoAsset')
  final String videoAssetPath;

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}
