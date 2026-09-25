import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppTextStyles {
  static TextStyle get primary => TextStyle(
        fontSize: 16.sp,
        height: 1.35,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get secondary => TextStyle(
        fontSize: 14.sp,
        height: 1.4,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get action => TextStyle(
        fontSize: 14.sp,
        height: 1.2,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get screenTitle => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get sectionTitle => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get body => TextStyle(fontSize: 14.sp, height: 1.4);
}
