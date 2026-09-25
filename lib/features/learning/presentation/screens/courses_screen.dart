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
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_cubit.dart';
import 'package:thaheen_task/features/learning/presentation/cubits/courses/courses_state.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_card.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CoursesCubit>()..load(),
      child: const _CoursesView(),
    );
  }
}

class _CoursesView extends StatelessWidget {
  const _CoursesView();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.l10n.coursesTitle,
      body: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          return switch (state) {
            CoursesInitial() || CoursesLoading() => const AppLoadingView(),
            CoursesEmpty() => AppEmptyView(message: context.l10n.noCourses),
            CoursesError(:final message) => AppErrorView(
                message: message,
                retryLabel: context.l10n.retry,
                onRetry: context.read<CoursesCubit>().load,
              ),
            CoursesLoaded(:final courses) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: courses.length,
                separatorBuilder: (_, _) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseCard(
                    course: course,
                    progressPercentage: 0,
                    onTap: () => context
                        .push(RoutePaths.courseDetailsLocation(course.id)),
                  );
                },
              ),
          };
        },
      ),
    );
  }
}
