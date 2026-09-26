import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_state.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/progress/progress_cubit.dart';

class LessonProgressListener extends StatelessWidget {
  const LessonProgressListener({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LessonPlayerCubit, LessonPlayerState>(
      listenWhen: (previous, current) =>
          previous.latestSavedProgress != current.latestSavedProgress,
      listener: (context, state) {
        final progress = state.latestSavedProgress;
        if (progress != null) {
          context.read<ProgressCubit>().lessonProgressSaved(progress);
        }
      },
      child: child,
    );
  }
}
