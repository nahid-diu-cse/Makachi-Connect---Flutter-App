import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/app_images.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_text_button.dart';
import 'package:makachi_connect/res/components/custom_blur_bg_container.dart';
import 'package:makachi_connect/res/components/custom_network_image.dart';
import 'package:makachi_connect/res/components/custom_search_bar.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(AppPaddings.bodyPadding),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Hi Chine,",
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppColors.pTextColor),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.locationSvg),
                              SizedBox(width: 5.w),
                              CustomText(
                                text: "137, Rose Avenue, New Work",
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(color: AppColors.pTextColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ClipOval(
                        child: CustomNetworkImage(
                          imageUrl: "imageUrl",
                          height: width * .15,
                          width: width * .15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomSearchBar(hintText: "Search Items...."),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Featured Events",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      CustomTextButton(
                        text: "View All",
                        onPressed: () {},
                        textStyle: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   shrinkWrap: true,
                  //   itemCount: 5,
                  //   itemBuilder: (context, index) {
                  //     return Container(child: Text("data"));
                  //   },
                  // ),
                  featuredEventWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget featuredEventWidget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * .6,
      height: height * .2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          CustomNetworkImage(
            imageUrl: "imageUrl",
            width: width * .6,
            height: height * .2,
            borderRadius: BorderRadius.circular(15),
          ),
          // Image.asset(
          //   AppImages.obOneBgImage,
          //   width: width * .6,
          //   height: height * .2,
          //   fit: BoxFit.cover, // or BoxFit.fill if you prefer stretching
          // ),

          Container(
            padding: EdgeInsets.all(8),
            width: width * .6,
            height: height * .2,
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
                    width: width * .08,
                    body: GestureDetector(
                      onTap: () {},
                      child: Image.asset(AppIcons.heartIcon),
                    ),
                  ),
                ),
                CustomBlurBgContainer(
                  width: width,
                  padding: EdgeInsets.all(10),
                  body: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Neon Party",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.pTextColor),
                          ),
                          CustomText(
                            text: "\$100",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.pTextColor),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: CustomText(
                          text: "New York, NY I Jun 26,2025 I 9.30 PM",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
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
