// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
  id: json['id'] as String,
  title: json['title'] as String,
  instructor: json['instructor'] as String,
  thumbnailAssetPath: json['thumbnail'] as String,
  sections: (json['sections'] as List<dynamic>)
      .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'instructor': instance.instructor,
      'thumbnail': instance.thumbnailAssetPath,
      'sections': instance.sections.map((e) => e.toJson()).toList(),
    };
