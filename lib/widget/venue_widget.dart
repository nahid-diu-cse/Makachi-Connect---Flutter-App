import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_colors.dart';
import '../res/app_icons.dart';
import '../res/components/custom_blur_bg_container.dart';
import '../res/components/custom_network_image.dart';
import '../res/components/custom_text.dart';

class VenueWidget extends StatefulWidget {
  final double? hgt;
  final double? wdt;
  final bool isAllVanueList;

  const VenueWidget({
    super.key,
    this.hgt,
    this.wdt,
    this.isAllVanueList = false,
  });

  @override
  State<VenueWidget> createState() => _VenueWidgetState();
}

class _VenueWidgetState extends State<VenueWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: widget.wdt ?? width * .6,
      height: widget.hgt ?? height * .2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          CustomNetworkImage(
            imageUrl: "imageUrl",
            width: widget.wdt ?? width * .6,
            height: widget.hgt ?? height * .2,
            borderRadius: BorderRadius.circular(15),
          ),

          Container(
            padding: EdgeInsets.all(widget.isAllVanueList ? 16 : 8),
            width: widget.wdt ?? width * .6,
            height: widget.hgt ?? height * .2,
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
                    width: widget.isAllVanueList ? width * .12 : width * .08,
                    body: GestureDetector(
                      onTap: () {},
                      child: Image.asset(AppIcons.heartIcon),
                    ),
                  ),
                ),
                CustomBlurBgContainer(
                  width: width,
                  padding: EdgeInsets.all(widget.isAllVanueList ? 20 : 10),
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
                              style: widget.isAllVanueList
                                  ? Theme.of(context).textTheme.bodyLarge!
                                        .copyWith(color: AppColors.pTextColor)
                                  : Theme.of(context).textTheme.bodyMedium!
                                        .copyWith(color: AppColors.pTextColor),
                            ),
                          ),
                          CustomText(
                            text: "\$100",
                            style: widget.isAllVanueList
                                ? Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: AppColors.pTextColor)
                                : Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(color: AppColors.pTextColor),
                          ),
                        ],
                      ),
                      // Align(
                      //   alignment: AlignmentDirectional.centerStart,
                      //   child: CustomText(
                      //     text: "New York, NY I Jun 26,2025 I 9.30 PM",
                      //     style: isAllVanueList
                      //         ? Theme.of(
                      //       context,
                      //     ).textTheme.bodyMedium!.copyWith(
                      //       fontSize: 12.sp,
                      //       color: AppColors.pTextColor,
                      //       fontWeight: FontWeight.w500,
                      //     )
                      //         : Theme.of(context).textTheme.bodySmall!.copyWith(
                      //       fontSize: 8.sp,
                      //       color: AppColors.pTextColor,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      // ),
                      Row(
                        children: [
                          tile(Icons.star, "4.9 (377)"),
                          SizedBox(width: 10),
                          tile(Icons.people, "250"),
                        ],
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

  Widget tile(IconData icon, String txt) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppColors.whiteColor),
        SizedBox(width: 5),
        CustomText(
          text: txt,
          style: widget.isAllVanueList
              ? Theme.of(context).textTheme.bodyMedium!.copyWith(
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
      ],
    );
  }
}
