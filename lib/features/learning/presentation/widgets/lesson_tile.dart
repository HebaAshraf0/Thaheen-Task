import 'package:flutter/material.dart';
import 'package:thaheen_task/core/extensions/duration_extensions.dart';
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
      onTap: onTap,
      leading: Icon(isLocked ? Icons.lock_outline : Icons.play_circle_outline),
      title: Text(lesson.title),
      subtitle: Text(lesson.duration.asPlayerTimestamp),
      trailing: LessonStatusBadge(status: status),
    );
  }
}
