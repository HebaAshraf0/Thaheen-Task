import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_progress_indicator.dart';

class ContinueWatchingCard extends StatelessWidget {
  const ContinueWatchingCard({
    required this.lessonTitle,
    required this.progress,
    required this.onTap,
    super.key,
  });

  final String lessonTitle;
  final LessonProgress progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.continueWatching,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 8.h),
              Text(lessonTitle, style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 12.h),
              CourseProgressIndicator(percentage: progress.watchedRatio * 100),
            ],
          ),
        ),
      ),
    );
  }
}
