import 'package:json_annotation/json_annotation.dart';
import 'package:thaheen_task/features/learning/data/models/lesson_model.dart';

part 'section_model.g.dart';

@JsonSerializable(explicitToJson: true)
final class SectionModel {
  const SectionModel({
    required this.id,
    required this.title,
    required this.lessons,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);

  final String id;
  final String title;
  final List<LessonModel> lessons;

  Map<String, dynamic> toJson() => _$SectionModelToJson(this);
}
