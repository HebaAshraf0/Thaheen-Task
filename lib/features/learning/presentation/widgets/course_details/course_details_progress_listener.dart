import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/progress/progress_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/progress/progress_state.dart';

class CourseDetailsProgressListener extends StatelessWidget {
  const CourseDetailsProgressListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProgressCubit, ProgressState>(
      listenWhen: (previous, current) =>
          previous.latestSavedProgress != current.latestSavedProgress,
      listener: (context, state) {
        final progress = state.latestSavedProgress;
        if (progress != null) {
          context.read<CourseDetailsCubit>().progressUpdated(progress);
        }
      },
      child: child,
    );
  }
}
