// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionModel _$SectionModelFromJson(Map<String, dynamic> json) => SectionModel(
  id: json['id'] as String,
  title: json['title'] as String,
  lessons: (json['lessons'] as List<dynamic>)
      .map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SectionModelToJson(SectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'lessons': instance.lessons.map((e) => e.toJson()).toList(),
    };
