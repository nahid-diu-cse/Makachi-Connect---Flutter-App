import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_input_field.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

import '../../res/components/buttons/custom_text_button.dart';
import '../../res/components/custom_blur_bg_container.dart';
import '../../res/components/custom_network_image.dart';
import '../../res/components/custom_text.dart';
import '../../widget/venue_widget.dart';
import '../home_view/featured_events/event_details_view.dart';
import '../home_view/featured_events/events_view.dart';
import '../home_view/featured_venues/featured_venues_view.dart';
import '../home_view/featured_venues/venue_details_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Explore", isLeading: false),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPaddings.bodyPadding),
                child: Container(
                  width: width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              prefixIcon: Icons.search,
                              label: "",
                              hintText: "Search Items..",
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: height * .058,
                            width: width * .12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.whiteColor.withOpacity(.5),
                              ),
                            ),
                            child: Image.asset(AppIcons.heartIcon),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Popular Venues",
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
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Trending Events",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          CustomTextButton(
                            text: "View All",
                            onPressed: () {
                              Get.to(
                                EventsView(),
                                transition: Transition.rightToLeft,
                                duration: Duration(milliseconds: 500),
                              );
                            },
                            textStyle: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.to(() => EventDetailsView()),
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: index == 4 ? 0 : 16.0,
                              ),
                              child: eventCard(
                                imgUrl: "imgUrl",
                                title: "Grand Elegance Hall",
                                time: "Jun 26,2025",
                                location: 'Los Angeles, CA',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget eventCard({
    required String imgUrl,
    required String title,
    required String time,
    required String location,
  }) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomNetworkImage(
                imageUrl: imgUrl,
                height: width * .25,
                width: width * .25,
                borderRadius: BorderRadius.circular(15),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  iconText(Icons.access_time, time),
                  SizedBox(height: 5),
                  iconText(Icons.place_outlined, location),
                ],
              ),
            ],
          ),

          Align(
            alignment: Alignment.centerRight,
            child: CustomBlurBgContainer(
              width: width * .12,
              body: GestureDetector(
                onTap: () {},
                child: Image.asset(AppIcons.heartIcon),
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
        SizedBox(width: 10),
        CustomText(
          text: text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.pTextColor.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}
