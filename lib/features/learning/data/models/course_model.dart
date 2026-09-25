import 'package:json_annotation/json_annotation.dart';
import 'package:thaheen_task/features/learning/data/models/section_model.dart';

part 'course_model.g.dart';

@JsonSerializable(explicitToJson: true)
final class CourseModel {
  const CourseModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.thumbnailAssetPath,
    required this.sections,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  final String id;
  final String title;
  final String instructor;

  @JsonKey(name: 'thumbnail')
  final String thumbnailAssetPath;

  final List<SectionModel> sections;

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
