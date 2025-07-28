import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:makachi_connect/res/app_theme.dart';
import 'package:makachi_connect/view/auth_view/login_view.dart';
import 'package:makachi_connect/view/bottom_nav_bar/bottom_nav_bar.dart';

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
          theme: AppTheme().themeData,
          home: LoginView(),
        );
      },
    );
  }
}
