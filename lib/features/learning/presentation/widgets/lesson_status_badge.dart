import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/app/theme/app_colors.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_status.dart';

class LessonStatusBadge extends StatelessWidget {
  const LessonStatusBadge({required this.status, super.key});

  final LessonStatus status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final semanticColors = Theme.of(
      context,
    ).extension<AppSemanticColors>()!;
    final (label, foreground, background) = switch (status) {
      LessonStatus.notStarted => (
          context.l10n.notStarted,
          colorScheme.onSurfaceVariant,
          colorScheme.surfaceContainerHighest,
        ),
      LessonStatus.inProgress => (
          context.l10n.inProgress,
          semanticColors.warning,
          semanticColors.warningContainer,
        ),
      LessonStatus.completed => (
          context.l10n.completed,
          semanticColors.success,
          semanticColors.successContainer,
        ),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(99.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        child: Text(
          label,
          style: TextStyle(
            color: foreground,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
