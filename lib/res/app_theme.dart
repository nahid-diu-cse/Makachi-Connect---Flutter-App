import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme{
  var themeData=ThemeData(
    scaffoldBackgroundColor: AppColors.bgColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 34.sp,
        fontWeight: FontWeight.bold,
        // color: AppColors.primaryColor,
        height: 1.4,
      ),
      displayMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        // color: AppColors.secondaryColor,
        height: 1.3,
      ),
      displaySmall: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.normal,
        // color: AppColors.textPrimary,
        height: 1.2,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        // color: AppColors.primaryColor,
        height: 1.4,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.pTextColor,
        height: 1.3,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.pTextColor,
        height: 1.2,
      ),
      titleLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
        height: 1.3,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.pTextColor,
        height: 1.2,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        // color: AppColors.textSecondary,
        height: 1.2,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.pTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.pTextColor,
        height: 1.4,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.sTextColor,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.pTextColor,
        height: 1.4,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        // color: AppColors.buttonTextColor,
        height: 1.3,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        // color: AppColors.textTertiary,
        height: 1.3,
      ),
    ),
  );
}