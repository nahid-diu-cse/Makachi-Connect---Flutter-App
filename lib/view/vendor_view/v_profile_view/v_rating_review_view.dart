import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_rating_bar.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

import '../../../res/app_colors.dart';
import '../../../res/components/custom_network_image.dart';

class VRatingReviewView extends StatefulWidget {
  VRatingReviewView({super.key});

  @override
  State<VRatingReviewView> createState() => _VRatingReviewViewState();
}

class _VRatingReviewViewState extends State<VRatingReviewView> {
  final Map<int, double> ratings = {5: 1.0, 4: 0.7, 3: 0.15, 2: 0.1, 1: 0.02};

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Rating and Review"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppPaddings.bodyPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: ratings.entries.map((entry) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: '${entry.key}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Container(
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade800,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: FractionallySizedBox(
                                            alignment: Alignment.centerLeft,
                                            widthFactor: entry.value,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  text: "4.7",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: AppColors.whiteColor.withOpacity(
                                          .7,
                                        ),
                                      ),
                                ),
                                CustomRatingBar(onRatingUpdate: (value) {}),
                                SizedBox(height: 10),
                                CustomText(
                                  text: "12 Reviews",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppColors.whiteColor.withOpacity(
                                          .7,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            feedback(
                              "userImage",
                              "Nahid Hasan",
                              3,
                              "description",
                            ),
                            divider(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget divider() {
    return Column(
      children: [
        SizedBox(height: 10),
        Divider(thickness: .2),
        SizedBox(height: 10),
      ],
    );
  }

  Widget feedback(
    String userImage,
    String userName,
    double rating,
    String description,
  ) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: CustomNetworkImage(
            imageUrl: userImage,
            width: width * .1,
            height: width * .1,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: userName),
              Row(
                children: [
                  CustomRatingBar(
                    onRatingUpdate: (value) {},
                    itemSize: 20,
                    rating: rating,
                  ),
                  SizedBox(width: 5.w),
                  CustomText(
                    text: "$rating",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomText(
                text: description,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.pTextColor.withOpacity(.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
