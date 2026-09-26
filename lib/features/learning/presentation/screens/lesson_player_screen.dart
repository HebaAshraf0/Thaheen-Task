import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thaheen_task/app/di/injection.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_player/lesson_loader.dart';

class LessonPlayerScreen extends StatelessWidget {
  const LessonPlayerScreen({
    required this.courseId,
    required this.lessonId,
    super.key,
  });

  final String courseId;
  final String lessonId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CourseDetailsCubit>()..load(courseId),
      child: LessonLoader(courseId: courseId, lessonId: lessonId),
    );
  }
}
