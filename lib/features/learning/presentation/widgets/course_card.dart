import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_progress_indicator.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    required this.course,
    required this.progressPercentage,
    required this.onTap,
    super.key,
  });

  final Course course;
  final double progressPercentage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 7,
              child: Image.asset(
                course.thumbnailAssetPath,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => ColoredBox(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(Icons.school_outlined, size: 48.r),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    course.instructor,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  Text(context.l10n.lessonsCount(course.lessonCount)),
                  SizedBox(height: 12.h),
                  CourseProgressIndicator(percentage: progressPercentage),
                  SizedBox(height: 6.h),
                  Text(
                    context.l10n.progressPercentage(progressPercentage.round()),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
