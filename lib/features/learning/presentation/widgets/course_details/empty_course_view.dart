import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/extensions/context_extensions.dart';
import 'package:thaheen_task/core/widgets/app_empty_view.dart';
import 'package:thaheen_task/features/learning/domain/entities/course.dart';
import 'package:thaheen_task/features/learning/presentation/widgets/course_details/course_summary.dart';

class EmptyCourseView extends StatelessWidget {
  const EmptyCourseView({required this.course, super.key});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
      children: [
        CourseSummary(course: course),
        SizedBox(height: 32.h),
        AppEmptyView(message: context.l10n.noLessons),
      ],
    );
  }
}
