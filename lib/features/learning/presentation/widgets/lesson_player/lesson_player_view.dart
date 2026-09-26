import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thaheen_task/app/router/route_paths.dart';
import 'package:thaheen_task/core/widgets/app_loading_view.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_state.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_player/current_lesson_card.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_player/lesson_player_error_banner.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_player/next_lesson_button.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/video_player_view.dart';

class LessonPlayerView extends StatelessWidget {
  const LessonPlayerView({
    required this.courseId,
    required this.lesson,
    super.key,
  });

  final String courseId;
  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonPlayerCubit, LessonPlayerState>(
      builder: (context, state) => state.map((state) {
        final progress = state.progress;
        if (progress == null) return const AppLoadingView();
        final courseDetailsCubit = context.read<CourseDetailsCubit>();
        final nextLesson = courseDetailsCubit.getNextLesson(
          currentLessonId: lesson.id,
        );
        final unlockedNextLesson = courseDetailsCubit.getNextUnlockedLesson(
          currentLessonId: lesson.id,
          progressByLessonId: {lesson.id: progress},
        );

        return LayoutBuilder(
          builder: (context, constraints) {
            final contentWidth = (constraints.maxWidth - 32.w)
                .clamp(0.0, 900.0)
                .toDouble();

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: SizedBox(
                  width: contentWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state.errorMessage case final message?) ...[
                        LessonPlayerErrorBanner(message: message),
                        SizedBox(height: 12.h),
                      ],
                      CurrentLessonCard(lesson: lesson),
                      SizedBox(height: 12.h),
                      Card(
                        margin: EdgeInsets.zero,
                        color: Colors.black,
                        clipBehavior: Clip.antiAlias,
                        child: VideoPlayerView(
                          assetPath: lesson.videoAssetPath,
                          initialPosition: progress.position,
                          onProgressChanged: (position, duration) {
                            context.read<LessonPlayerCubit>().positionChanged(
                              position: position,
                              duration: duration,
                            );
                          },
                        ),
                      ),
                      if (nextLesson != null) ...[
                        SizedBox(height: 16.h),
                        NextLessonButton(
                          lesson: nextLesson,
                          isUnlocked: unlockedNextLesson != null,
                          onPressed: () => context.pushReplacement(
                            RoutePaths.lessonPlayerLocation(
                              courseId: courseId,
                              lessonId: nextLesson.id,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
