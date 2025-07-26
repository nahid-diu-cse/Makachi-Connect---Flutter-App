import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/components/buttons/custom_text_button.dart';
import 'package:makachi_connect/view/bottom_nav_bar/bottom_nav_bar.dart';

import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../res/app_paddings.dart';
import '../../res/components/buttons/custom_button.dart';
import '../../res/components/custom_text.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                AppImages.welcomeBg,
                fit: BoxFit.cover, // Ensures the image covers the entire screen
              ),
            ),
            Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  // Blurred container
                  Container(
                    height: height * .4,
                    width: width,
                    decoration: BoxDecoration(
                      color: AppColors.bgColor.withOpacity(0.1),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.bgColor.withOpacity(0.1),
                          blurRadius: 50,
                        ),
                      ],
                    ),
                    child: ClipRect(
                      // ClipRect to ensure the blur stays inside the container
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                        // Adjust blur
                        child:
                            Container(), // Empty container for the blur effect
                      ),
                    ),
                  ),

                  // Your content on top of the blurred container
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(AppPaddings.bodyPadding),
                      child: Column(
                        children: [
                          CustomText(
                            text: "Welcome Back!",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: 8.h),
                          CustomText(
                            textAlign: TextAlign.center,
                            text:
                                "Makachi  is here to help you to find the best venue based on your interests.",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: AppColors.pTextColor.withOpacity(.8),
                                ),
                          ),
                          SizedBox(height: 24.h),
                          CustomButton(
                            textColor: AppColors.pTextColor,
                            width: width,
                            onPressed: () {
                              // Get.to(
                              //   ObThreeView(),
                              //   transition: Transition.rightToLeft,
                              //   duration: Duration(milliseconds: 500),
                              // );
                            },
                            text: "Login",
                          ),
                          SizedBox(height: 16.h),
                          CustomButton(
                            textColor: AppColors.sTextColor,
                            backgroundColor: AppColors.secondaryColor,
                            width: width,
                            onPressed: () {
                              // Get.to(
                              //   ObThreeView(),
                              //   transition: Transition.rightToLeft,
                              //   duration: Duration(milliseconds: 500),
                              // );
                            },
                            text: "Sign Up",
                          ),
                          SizedBox(height: 16.h),
                          CustomTextButton(
                            text: "Continue as Guest",
                            onPressed: () {
                              Get.to(
                                BottomNavBar(),
                                transition: Transition.rightToLeft,
                                duration: Duration(milliseconds: 500),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
