import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thaheen_task/app/di/injection.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_details/course_details_progress_listener.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_details/course_details_view.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({required this.courseId, super.key});

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CourseDetailsCubit>()..load(courseId),
      child: CourseDetailsProgressListener(
        child: CourseDetailsView(courseId: courseId),
      ),
    );
  }
}
