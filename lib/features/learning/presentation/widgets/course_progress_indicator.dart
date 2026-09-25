import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseProgressIndicator extends StatelessWidget {
  const CourseProgressIndicator({required this.percentage, super.key});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final normalized = (percentage / 100).clamp(0.0, 1.0);
    return LinearProgressIndicator(
      value: normalized,
      minHeight: 6.h,
      borderRadius: BorderRadius.circular(99.r),
    );
  }
}
