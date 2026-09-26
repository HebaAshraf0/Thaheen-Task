import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thaheen_task/app/router/route_paths.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/continue_watching/continue_watching_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/continue_watching/continue_watching_state.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/continue_watching_card.dart';

class ContinueWatchingSection extends StatelessWidget {
  const ContinueWatchingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContinueWatchingCubit, ContinueWatchingState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (continueWatching) => Column(
          children: [
            ContinueWatchingCard(
              courseTitle: continueWatching.course.title,
              lessonTitle: continueWatching.lesson.title,
              progress: continueWatching.progress,
              onTap: () => context.push(
                RoutePaths.lessonPlayerLocation(
                  courseId: continueWatching.course.id,
                  lessonId: continueWatching.lesson.id,
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
