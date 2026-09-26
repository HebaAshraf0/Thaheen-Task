import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';

class NextLessonButton extends StatelessWidget {
  const NextLessonButton({
    required this.lesson,
    required this.isUnlocked,
    required this.onPressed,
    super.key,
  });

  final Lesson lesson;
  final bool isUnlocked;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: isUnlocked ? onPressed : null,
            icon: Icon(
              isUnlocked ? Icons.skip_next_rounded : Icons.lock_outline_rounded,
            ),
            label: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.l10n.nextLesson),
                  Text(
                    lesson.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isUnlocked
                          ? colorScheme.onPrimary.withValues(alpha: 0.78)
                          : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isUnlocked) ...[
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 17.r,
                color: colorScheme.onSurfaceVariant,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: AppText.secondary(
                  context.l10n.lockedLessonMessage,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
