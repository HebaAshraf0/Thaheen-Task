import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thaheen_task/app/router/route_paths.dart';
import 'package:thaheen_task/app/widgets/app_scaffold.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_empty_view.dart';
import 'package:thaheen_task/core/widgets/app_error_view.dart';
import 'package:thaheen_task/core/widgets/app_loading_view.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/course_details/course_details_state.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_details/course_section_card.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_details/course_summary.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_details/empty_course_view.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({required this.courseId, super.key});

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.l10n.courseDetailsTitle,
      showBackButton: true,
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const AppLoadingView(),
            loading: () => const AppLoadingView(),
            empty: (course) => EmptyCourseView(course: course),
            notFound: () => AppEmptyView(message: context.l10n.courseNotFound),
            error: (message) => AppErrorView(
              message: message,
              retryLabel: context.l10n.retry,
              onRetry: () => context.read<CourseDetailsCubit>().load(courseId),
            ),
            loaded: (course, progressByLessonId) => ListView(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
              children: [
                CourseSummary(course: course),
                SizedBox(height: 24.h),
                AppText.primary(
                  context.l10n.courseContent,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 12.h),
                for (final section in course.sections) ...[
                  CourseSectionCard(
                    section: section,
                    progressByLessonId: progressByLessonId,
                    isLessonUnlocked: (lesson) =>
                        context.read<CourseDetailsCubit>().isLessonUnlocked(
                          lessonId: lesson.id,
                          progressByLessonId: progressByLessonId,
                        ),
                    onLessonTap: (lesson) {
                      context.push(
                        RoutePaths.lessonPlayerLocation(
                          courseId: course.id,
                          lessonId: lesson.id,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
