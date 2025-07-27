import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_colors.dart';
import '../res/app_icons.dart';
import '../res/components/custom_blur_bg_container.dart';
import '../res/components/custom_network_image.dart';
import '../res/components/custom_text.dart';

class EventWidget extends StatelessWidget {
  final double? hgt;
  final double? wdt;
  final bool isAllEventList;

  const EventWidget({
    super.key,
    this.hgt,
    this.wdt,
    this.isAllEventList = false,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: wdt ?? width * .6,
      height: hgt ?? height * .2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          CustomNetworkImage(
            imageUrl: "imageUrl",
            width: wdt ?? width * .6,
            height: hgt ?? height * .2,
            borderRadius: BorderRadius.circular(15),
          ),

          Container(
            padding: EdgeInsets.all(isAllEventList ? 16 : 8),
            width: wdt ?? width * .6,
            height: hgt ?? height * .2,
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomBlurBgContainer(
                    width: isAllEventList ? width * .12 : width * .08,
                    body: GestureDetector(
                      onTap: () {},
                      child: Image.asset(AppIcons.heartIcon),
                    ),
                  ),
                ),
                CustomBlurBgContainer(
                  width: width,
                  padding: EdgeInsets.all(isAllEventList ? 20 : 10),
                  body: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: "Neon Party",
                              style: isAllEventList
                                  ? Theme.of(context).textTheme.bodyLarge!
                                        .copyWith(color: AppColors.pTextColor)
                                  : Theme.of(context).textTheme.bodyMedium!
                                        .copyWith(color: AppColors.pTextColor),
                            ),
                          ),
                          CustomText(
                            text: "\$100",
                            style: isAllEventList
                                ? Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: AppColors.pTextColor)
                                : Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppColors.pTextColor),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: CustomText(
                          text: "New York, NY I Jun 26,2025 I 9.30 PM",
                          style: isAllEventList
                              ? Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.pTextColor,
                                  fontWeight: FontWeight.w500,
                                )
                              : Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 8.sp,
                                  color: AppColors.pTextColor,
                                  fontWeight: FontWeight.w400,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
