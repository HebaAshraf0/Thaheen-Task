import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/app/theme/app_colors.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final semanticColors = Theme.of(context).extension<AppSemanticColors>()!;
    final (icon, foreground, background) = isLocked
        ? (
            Icons.lock_outline_rounded,
            colorScheme.onSurfaceVariant,
            colorScheme.surfaceContainerHighest,
          )
        : switch (status) {
            LessonStatus.notStarted => (
              Icons.play_arrow_rounded,
              colorScheme.primary,
              colorScheme.primaryContainer,
            ),
            LessonStatus.inProgress => (
              Icons.timelapse_rounded,
              semanticColors.warning,
              semanticColors.warningContainer,
            ),
            LessonStatus.completed => (
              Icons.check_rounded,
              semanticColors.success,
              semanticColors.successContainer,
            ),
          };

    return ListTile(
      enabled: !isLocked,
      onTap: isLocked ? null : onTap,
      leading: Container(
        width: 42.r,
        height: 42.r,
        decoration: BoxDecoration(color: background, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Icon(icon, size: 22.r, color: foreground),
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
      trailing: LessonStatusBadge(status: status, isLocked: isLocked),
    );
  }
}
