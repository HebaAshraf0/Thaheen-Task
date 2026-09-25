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
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
                itemCount: courses.length + 1,
                separatorBuilder: (_, _) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  if (index == 0) return const _CoursesWelcomeCard();

                  final course = courses[index - 1];
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

class _CoursesWelcomeCard extends StatelessWidget {
  const _CoursesWelcomeCard();

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
        child: Row(
          children: [
            Container(
              width: 52.r,
              height: 52.r,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.auto_stories_rounded,
                size: 26.r,
                color: colorScheme.onPrimary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.primary(
                    context.l10n.appTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 4.h),
                  AppText.secondary(context.l10n.coursesSubtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
