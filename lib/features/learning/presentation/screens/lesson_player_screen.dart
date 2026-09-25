import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/app/di/injection.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_empty_view.dart';
import 'package:thaheen_task/core/widgets/app_error_view.dart';
import 'package:thaheen_task/core/widgets/app_loading_view.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_state.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_state.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/video_player_view.dart';

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
      child: _LessonLoader(courseId: courseId, lessonId: lessonId),
    );
  }
}

class _LessonLoader extends StatelessWidget {
  const _LessonLoader({required this.courseId, required this.lessonId});

  final String courseId;
  final String lessonId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.lessonPlayerTitle)),
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          return switch (state) {
            CourseDetailsInitial() ||
            CourseDetailsLoading() =>
              const AppLoadingView(),
            CourseDetailsNotFound() => AppEmptyView(
                message: context.l10n.courseNotFound,
              ),
            CourseDetailsError(:final message) => AppErrorView(
                message: message,
                retryLabel: context.l10n.retry,
                onRetry: () =>
                    context.read<CourseDetailsCubit>().load(courseId),
              ),
            CourseDetailsLoaded(:final course) => _buildLesson(
                context,
                course.lessonById(lessonId),
              ),
          };
        },
      ),
    );
  }

  Widget _buildLesson(BuildContext context, Lesson? lesson) {
    if (lesson == null) {
      return AppEmptyView(message: context.l10n.courseNotFound);
    }
    return BlocProvider(
      create: (_) => getIt<LessonPlayerCubit>()..initialize(lesson),
      child: _LessonPlayerView(lesson: lesson),
    );
  }
}

class _LessonPlayerView extends StatelessWidget {
  const _LessonPlayerView({required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonPlayerCubit, LessonPlayerState>(
      builder: (context, state) {
        final progress = state.progress;
        if (progress == null) return const AppLoadingView();
        return ListView(
          children: [
            VideoPlayerView(
              assetPath: lesson.videoAssetPath,
              initialPosition: progress.position,
              onProgressChanged: (position, duration) {
                context.read<LessonPlayerCubit>().positionChanged(
                      position: position,
                      duration: duration,
                    );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                lesson.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
