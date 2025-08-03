import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_check_box.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

class VMakachiPremiumView extends StatelessWidget {
  const VMakachiPremiumView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Makachi Plan"),
          Padding(
            padding: EdgeInsets.all(AppPaddings.bodyPadding),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              width: width,
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Premium Plan",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  CustomText(
                    text: "High acquisition, entry funnel to upsell",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.whiteColor.withOpacity(.5),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      CustomText(
                        text: "\$50/ ",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                      CustomText(
                        text: "month",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppColors.whiteColor.withOpacity(.7),
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomCheckBox(
                    isChecked: true,
                    size: 20,
                    onChanged: (value) {},
                    borderRadius: width,
                    label: "User Can Access Phone Number",
                    labelStyle: Theme.of(context).textTheme.bodyMedium!
                        .copyWith(color: AppColors.whiteColor.withOpacity(.7)),
                  ),
                  SizedBox(height: 5.h),
                  CustomCheckBox(
                    isChecked: true,
                    size: 20,
                    onChanged: (value) {},
                    borderRadius: width,
                    label: "User can see Website",
                    labelStyle: Theme.of(context).textTheme.bodyMedium!
                        .copyWith(color: AppColors.whiteColor.withOpacity(.7)),
                  ),
                  SizedBox(height: 5.h),
                  CustomCheckBox(
                    isChecked: true,
                    size: 20,
                    onChanged: (value) {},
                    borderRadius: width,
                    label: "User Can Access Email ID",
                    labelStyle: Theme.of(context).textTheme.bodyMedium!
                        .copyWith(color: AppColors.whiteColor.withOpacity(.7)),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    onPressed: () {},
                    text: "Purchase Plan",
                    width: width,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
