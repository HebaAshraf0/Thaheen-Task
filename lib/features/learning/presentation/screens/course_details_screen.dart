import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thaheen_task/app/di/injection.dart';
import 'package:thaheen_task/app/router/route_paths.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_empty_view.dart';
import 'package:thaheen_task/core/widgets/app_error_view.dart';
import 'package:thaheen_task/core/widgets/app_loading_view.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_status.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_state.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_tile.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({required this.courseId, super.key});

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CourseDetailsCubit>()..load(courseId),
      child: _CourseDetailsView(courseId: courseId),
    );
  }
}

class _CourseDetailsView extends StatelessWidget {
  const _CourseDetailsView({required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.courseDetailsTitle)),
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
            CourseDetailsLoaded(:final course) => ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    course.instructor,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  SizedBox(height: 24.h),
                  for (final section in course.sections) ...[
                    Text(
                      section.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    SizedBox(height: 8.h),
                    for (final lesson in section.lessons)
                      LessonTile(
                        lesson: lesson,
                        status: LessonStatus.notStarted,
                        isLocked: false,
                        onTap: () => context.push(
                          RoutePaths.lessonPlayerLocation(
                            courseId: course.id,
                            lessonId: lesson.id,
                          ),
                        ),
                      ),
                    SizedBox(height: 20.h),
                  ],
                ],
              ),
          };
        },
      ),
    );
  }
}
