import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_images.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/bottom_nav_bar/bottom_nav_bar.dart';

import '../../res/app_colors.dart';
import '../../res/components/buttons/custom_button.dart';
import '../../res/components/custom_text.dart';

class EnableLocationView extends StatelessWidget {
  const EnableLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Container(
        padding: EdgeInsets.all(AppPaddings.bodyPadding),
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: "Enable Location",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.pTextColor.withOpacity(.9),
              ),
            ),
            SizedBox(height: 30),
            SvgPicture.asset(AppImages.locationFrame),
            SizedBox(height: 30),
            CustomText(
              text: "Location",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.pTextColor.withOpacity(.9),
              ),
            ),
            SizedBox(height: 30),
            CustomText(
              text:
                  "Your location services are switched off. Please enable location, to help us serve better.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.pTextColor.withOpacity(.5),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                Get.to(() => BottomNavBar());
              },
              text: "Enable Location",
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
