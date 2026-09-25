import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/duration_extensions.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_status.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_status_badge.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({
    required this.lesson,
    required this.status,
    required this.isLocked,
    required this.onTap,
    super.key,
  });

  final Lesson lesson;
  final LessonStatus status;
  final bool isLocked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: !isLocked,
      onTap: isLocked ? null : onTap,
      leading: Container(
        width: 42.r,
        height: 42.r,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          isLocked ? Icons.lock_outline_rounded : Icons.play_arrow_rounded,
          size: 22.r,
          color: isLocked
              ? Theme.of(context).colorScheme.onSurfaceVariant
              : Theme.of(context).colorScheme.primary,
        ),
      ),
      title: AppText.primary(
        lesson.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.schedule_rounded,
              size: 14.r,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            SizedBox(width: 4.w),
            AppText.secondary(
              lesson.duration.asPlayerTimestamp,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      trailing: LessonStatusBadge(status: status),
    );
  }
}
