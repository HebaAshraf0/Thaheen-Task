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
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_state.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_card.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/courses/continue_watching_section.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.l10n.coursesTitle,
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const AppLoadingView(),
            loading: () => const AppLoadingView(),
            empty: () => AppEmptyView(message: context.l10n.noCourses),
            error: (message) => AppErrorView(
              message: message,
              retryLabel: context.l10n.retry,
              onRetry: context.read<CoursesCubit>().load,
            ),
            loaded: (courses, progressByCourseId) => ListView(
              padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
              children: [
                const ContinueWatchingSection(),
                for (var index = 0; index < courses.length; index++) ...[
                  if (index > 0) SizedBox(height: 16.h),
                  CourseCard(
                    course: courses[index],
                    progressPercentage:
                        progressByCourseId[courses[index].id] ?? 0,
                    onTap: () => context.push(
                      RoutePaths.courseDetailsLocation(courses[index].id),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
