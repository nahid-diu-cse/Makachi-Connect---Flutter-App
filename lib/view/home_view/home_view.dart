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
import 'package:makachi_connect/view/home_view/featured_events/featured_events_view.dart';
import 'package:makachi_connect/widget/event_widget.dart';

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
                          text: "Featured Events",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        CustomTextButton(
                          text: "View All",
                          onPressed: () {
                            Get.to(
                              FeaturedEventsView(),
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
                            child: EventWidget(),
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
                            child: ticketWidget(),
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

  Widget ticketWidget() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(24),
      height: height * .2,
      width: width * .8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.ticketCard),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomNetworkImage(
                imageUrl: "imageUrl",
                width: width * .12,
                height: width * .12,
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Music Jamming Outdoor",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.calenderSvg),
                        SizedBox(width: 5),
                        CustomText(
                          text: "07 Jun, 2025",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColors.pTextColor.withOpacity(.7),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Time",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.pTextColor.withOpacity(.7),
                      ),
                    ),
                    CustomText(
                      maxLines: 1,
                      text: "10:00 PM",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Location",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.pTextColor.withOpacity(.7),
                      ),
                    ),
                    CustomText(
                      text: "California, CA",
                      maxLines: 1,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),

              CustomTextButton(
                backgroundColor: Color(0xFF121212),
                borderRadius: 30,
                padding: EdgeInsets.all(8),
                text: "Premium ticket x1",
                onPressed: () {},
                textStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
