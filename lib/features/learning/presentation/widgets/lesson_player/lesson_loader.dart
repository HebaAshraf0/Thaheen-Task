import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thaheen_task/app/di/injection.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_empty_view.dart';
import 'package:thaheen_task/core/widgets/app_error_view.dart';
import 'package:thaheen_task/core/widgets/app_loading_view.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_state.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/lesson_player/lesson_player_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_player/lesson_progress_listener.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_player/lesson_player_view.dart';

class LessonLoader extends StatelessWidget {
  const LessonLoader({
    required this.courseId,
    required this.lessonId,
    super.key,
  });

  final String courseId;
  final String lessonId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.lessonPlayerTitle)),
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const AppLoadingView(),
            loading: () => const AppLoadingView(),
            notFound: () => AppEmptyView(message: context.l10n.courseNotFound),
            error: (message) => AppErrorView(
              message: message,
              retryLabel: context.l10n.retry,
              onRetry: () => context.read<CourseDetailsCubit>().load(courseId),
            ),
            loaded: (course, _) =>
                _buildLesson(context, course.lessonById(lessonId)),
          );
        },
      ),
    );
  }

  Widget _buildLesson(BuildContext context, Lesson? lesson) {
    if (lesson == null) {
      return AppEmptyView(message: context.l10n.courseNotFound);
    }

    return BlocProvider(
      create: (_) =>
          getIt<LessonPlayerCubit>()
            ..initialize(courseId: courseId, lesson: lesson),
      child: LessonProgressListener(
        child: LessonPlayerView(courseId: courseId, lesson: lesson),
      ),
    );
  }
}
