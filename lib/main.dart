import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:makachi_connect/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (child, context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Makachi Connect',
          theme: ThemeData(
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
                // color: AppColors.textPrimary,
                height: 1.5,
              ),
              bodyMedium: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                // color: AppColors.textSecondary,
                height: 1.4,
              ),
              bodySmall: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.sTextColor,
              ),
              labelLarge: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                // color: AppColors.buttonTextColor,
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
          ),
          home: BottomNavBar(),
        );
      },
    );
  }
}
