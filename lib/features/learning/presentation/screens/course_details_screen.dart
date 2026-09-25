import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thaheen_task/app/di/injection.dart';
import 'package:thaheen_task/app/router/route_paths.dart';
import 'package:thaheen_task/app/widgets/app_scaffold.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_empty_view.dart';
import 'package:thaheen_task/core/widgets/app_error_view.dart';
import 'package:thaheen_task/core/widgets/app_loading_view.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
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
    return AppScaffold(
      title: context.l10n.courseDetailsTitle,
      showBackButton: true,
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
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
                children: [
                  _CourseSummary(course: course),
                  SizedBox(height: 24.h),
                  AppText.primary(
                    context.l10n.courseContent,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 12.h),
                  for (final section in course.sections) ...[
                    _CourseSectionCard(
                      section: section,
                      onLessonTap: (lesson) => context.push(
                        RoutePaths.lessonPlayerLocation(
                          courseId: course.id,
                          lessonId: lesson.id,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ],
              ),
          };
        },
      ),
    );
  }
}

class _CourseSummary extends StatelessWidget {
  const _CourseSummary({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.surfaceContainerLow,
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.menu_book_rounded,
                size: 23.r,
                color: colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            AppText.primary(
              course.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 6.h),
            AppText.secondary(
              course.instructor,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Icon(
                  Icons.play_circle_outline_rounded,
                  size: 18.r,
                  color: colorScheme.primary,
                ),
                SizedBox(width: 6.w),
                AppText.secondary(
                  context.l10n.lessonsCount(course.lessonCount),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseSectionCard extends StatelessWidget {
  const _CourseSectionCard({
    required this.section,
    required this.onLessonTap,
  });

  final CourseSection section;
  final ValueChanged<Lesson> onLessonTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                Expanded(
                  child: AppText.primary(
                    section.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(width: 8.w),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    child: AppText.secondary(
                      context.l10n.lessonsCount(section.lessons.length),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          for (var index = 0; index < section.lessons.length; index++) ...[
            LessonTile(
              lesson: section.lessons[index],
              status: LessonStatus.notStarted,
              isLocked: false,
              onTap: () => onLessonTap(section.lessons[index]),
            ),
            if (index < section.lessons.length - 1)
              Padding(
                padding: EdgeInsetsDirectional.only(start: 72.w),
                child: const Divider(),
              ),
          ],
        ],
      ),
    );
  }
}
