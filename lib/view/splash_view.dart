import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_images.dart';
import 'package:makachi_connect/view/onboarding_view/ob_one_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => ObOneView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AppImages.logo)));
  }
}
