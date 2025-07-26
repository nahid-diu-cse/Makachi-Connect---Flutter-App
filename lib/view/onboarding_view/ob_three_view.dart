import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/view/onboarding_view/welcome_view.dart';

import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../res/app_paddings.dart';
import '../../res/components/buttons/custom_button.dart';
import '../../res/components/custom_text.dart';

class ObThreeView extends StatelessWidget {
  const ObThreeView({super.key});

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
                AppImages.obThreeBgImage,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              AppImages.logo,
                              width: width * .3,
                              height: height * .1,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Venue",
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: AppColors.pTextColor.withOpacity(
                                        .5,
                                      ),
                                    ),
                              ),
                              Image.asset(AppImages.dot),
                              CustomText(
                                text: "Event",
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: AppColors.pTextColor.withOpacity(
                                        .5,
                                      ),
                                    ),
                              ),
                              Image.asset(AppImages.dot),
                              CustomText(
                                text: "Ticket",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Image.asset(AppImages.dot),
                              CustomText(
                                text: "and More",
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      color: AppColors.pTextColor.withOpacity(
                                        .5,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          CustomText(
                            text:
                                "Browse and book stunning venues for your next event effortlessly.",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 24.h),
                          CustomButton(
                            width: width,
                            onPressed: () {
                              Get.to(
                                WelcomeView(),
                                transition: Transition.rightToLeft,
                                duration: Duration(milliseconds: 500),
                              );
                            },
                            text: "Get Started",
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
