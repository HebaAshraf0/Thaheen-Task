import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thaheen_task/core/widgets/app_text.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: AppText.secondary(message, textAlign: TextAlign.center),
      ),
    );
  }
}
