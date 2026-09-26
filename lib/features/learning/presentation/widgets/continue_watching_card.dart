import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/extensions/duration_extensions.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_progress_indicator.dart';

class ContinueWatchingCard extends StatelessWidget {
  const ContinueWatchingCard({
    required this.courseTitle,
    required this.lessonTitle,
    required this.progress,
    required this.onTap,
    super.key,
  });

  final String courseTitle;
  final String lessonTitle;
  final LessonProgress progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final progressPercentage = (progress.watchedRatio * 100).round();

    return Card(
      color: colorScheme.primaryContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42.r,
                    height: 42.r,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: colorScheme.onPrimary,
                      size: 25.r,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.action(
                          context.l10n.continueWatching,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(height: 2.h),
                        AppText.secondary(
                          courseTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              AppText.primary(
                lessonTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  AppText.secondary(
                    '${progress.position.asPlayerTimestamp} / '
                    '${progress.duration.asPlayerTimestamp}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  AppText.action(
                    context.l10n.progressPercentage(progressPercentage),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              CourseProgressIndicator(percentage: progress.watchedRatio * 100),
            ],
          ),
        ),
      ),
    );
  }
}
