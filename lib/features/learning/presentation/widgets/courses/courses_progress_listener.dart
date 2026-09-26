import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/continue_watching/continue_watching_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/progress/progress_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/progress/progress_state.dart';

class CoursesProgressListener extends StatelessWidget {
  const CoursesProgressListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProgressCubit, ProgressState>(
      listenWhen: (previous, current) =>
          previous.latestSavedProgress != current.latestSavedProgress,
      listener: (context, state) {
        final progress = state.latestSavedProgress;
        if (progress == null) return;

        context.read<CoursesCubit>().progressUpdated(progress);
        unawaited(
          context.read<ContinueWatchingCubit>().progressUpdated(progress),
        );
      },
      child: child,
    );
  }
}
