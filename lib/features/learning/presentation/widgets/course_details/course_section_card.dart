import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';
import 'package:thaheen_task/features/learning/domain/entities/course_section.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_progress.dart';
import 'package:thaheen_task/features/learning/domain/entities/lesson_status.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/lesson_tile.dart';

class CourseSectionCard extends StatelessWidget {
  const CourseSectionCard({
    required this.section,
    required this.progressByLessonId,
    required this.isLessonUnlocked,
    required this.onLessonTap,
    super.key,
  });

  final CourseSection section;
  final Map<String, LessonProgress> progressByLessonId;
  final bool Function(Lesson lesson) isLessonUnlocked;
  final ValueChanged<Lesson> onLessonTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                Expanded(
                  child: AppText.primary(
                    section.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(width: 8.w),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(99.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    child: AppText.secondary(
                      context.l10n.lessonsCount(section.lessons.length),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          for (var index = 0; index < section.lessons.length; index++) ...[
            Builder(
              builder: (context) {
                final lesson = section.lessons[index];
                final progress = progressByLessonId[lesson.id];

                return LessonTile(
                  lesson: lesson,
                  status: progress?.status ?? LessonStatus.notStarted,
                  isLocked: !isLessonUnlocked(lesson),
                  onTap: () => onLessonTap(lesson),
                );
              },
            ),
            if (index < section.lessons.length - 1)
              Padding(
                padding: EdgeInsetsDirectional.only(start: 72.w),
                child: const Divider(),
              ),
          ],
        ],
      ),
    );
  }
}
