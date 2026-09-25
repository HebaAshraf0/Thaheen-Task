import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
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
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
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
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppText.primary(
                          course.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 20.r,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        size: 18.r,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: AppText.secondary(
                          course.instructor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Icon(
                        Icons.play_circle_outline_rounded,
                        size: 18.r,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(width: 6.w),
                      AppText.secondary(
                        context.l10n.lessonsCount(course.lessonCount),
                      ),
                      const Spacer(),
                      AppText.action(
                        context.l10n.progressPercentage(
                          progressPercentage.round(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CourseProgressIndicator(percentage: progressPercentage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
