import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
import 'package:makachi_connect/view/home_view/featured_venues/venue_details_view.dart';
import 'package:makachi_connect/widget/ticket_widget.dart';
import 'package:makachi_connect/widget/venue_widget.dart';

import 'featured_venues/featured_venues_view.dart';

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
        child: SingleChildScrollView(
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
                          text: "Featured Vanues",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        CustomTextButton(
                          text: "View All",
                          onPressed: () {
                            Get.to(
                              FeaturedVenuesView(),
                              transition: Transition.rightToLeft,
                              duration: Duration(milliseconds: 500),
                            );
                          },
                          textStyle: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.only(
                              right: index == 4 ? 0 : 12.w,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => VenueDetailsView());
                              },
                              child: VenueWidget(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Categories",
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.start,
                        ),
                        CustomTextButton(
                          text: "",
                          onPressed: () {},
                          textStyle: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.only(
                              right: index == 4 ? 0 : 12.w,
                            ),
                            child: categoryWidget(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Tickets",
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.only(
                              right: index == 4 ? 0 : 12.w,
                            ),
                            child: TicketWidget(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryWidget() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .6,
      height: height * .1,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          CustomNetworkImage(
            imageUrl: "imageUrl",
            width: width * .6,
            height: height * .1,
            borderRadius: BorderRadius.circular(15),
          ),
          CustomBlurBgContainer(
            blurSigma: 1,
            width: width,
            padding: EdgeInsets.all(10),
            body: Center(
              child: CustomText(
                text: "Venue",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: AppColors.pTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
