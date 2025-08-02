import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_input_field.dart';
import 'package:makachi_connect/res/components/custom_rating_bar.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

import '../../res/components/custom_network_image.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({super.key});

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              Get.back(); // dismiss the modal/view
            },
            child: Container(
              color: Colors.transparent, // Necessary for GestureDetector to work
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(AppPaddings.bodyPadding),
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(.05),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),

                  CustomText(
                    text: "Write Review",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.pTextColor,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    padding: EdgeInsets.all(AppPaddings.bodyPadding),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            CustomNetworkImage(
                              imageUrl: "imgUrl",
                              height: width * .20,
                              width: width * .20,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Grand Elegance Hall",
                                  maxLines: 1,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium,
                                ),
                                SizedBox(height: 10),
                                iconText(Icons.wallet_giftcard, "\$50"),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    iconText(
                                      Icons.star_border_outlined,
                                      "rating",
                                    ),
                                    SizedBox(width: 5.w),
                                    iconText(
                                      Icons.people_alt_outlined,
                                      "people",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  CustomText(
                    text: "How is your order",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  CustomText(
                    text: "Please give your rating",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomRatingBar(
                    onRatingUpdate: (onRatingUpdate) {},
                    itemSize: 30,
                  ),
                  SizedBox(height: 20),
                  CustomInputField(
                    maxLines: 4,
                    label: "Add details review",
                    hintText: "Enter here",
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    onPressed: () {},
                    text: "Submit",
                    width: width,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget iconText(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.whiteColor.withOpacity(.5)),
        SizedBox(width: 5),
        CustomText(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          text: text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.pTextColor.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
