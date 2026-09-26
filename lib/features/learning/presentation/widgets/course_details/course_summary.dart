import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';

class CourseSummary extends StatelessWidget {
  const CourseSummary({required this.course, super.key});

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
