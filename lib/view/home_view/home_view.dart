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
import 'package:makachi_connect/view/home_view/featured_events/events_view.dart';
import 'package:makachi_connect/view/home_view/featured_venues/venue_details_view.dart';
import 'package:makachi_connect/view/home_view/featured_venues/venues_view.dart';
import 'package:makachi_connect/view/home_view/tickets/featured_tickets_view.dart';
import 'package:makachi_connect/view/home_view/tickets/ticket_details_view.dart';
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
          padding: EdgeInsets.all(AppPaddings.bodyPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- Header ----------
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
                      SizedBox(height: 4),
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
                      imageUrl:
                          "https://img.freepik.com/free-photo/type-entertainment-complex-popular-resort-with-pools-water-parks-turkey-with-more-than-5-million-visitors-year-amara-dolce-vita-luxury-hotel-resort-tekirova-kemer_146671-18728.jpg?semt=ais_hybrid&w=740&q=80",
                      height: width * .15,
                      width: width * .15,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              CustomSearchBar(hintText: "Search Items...."),
              SizedBox(height: 16),

              // ---------- Featured Venues ----------
              sectionHeader(
                title: "Featured Venues",
                onViewAll: () {
                  Get.to(
                    () => const FeaturedVenuesView(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 500),
                  );
                },
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: index == 4 ? 0 : 12.w),
                      child: GestureDetector(
                        onTap: () => Get.to(() => const VenueDetailsView()),
                        child: const VenueWidget(),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // ---------- Categories ----------
              CustomText(
                text: "Categories",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.to(() => const VenuesView()),
                      child: categoryWidget("Venue", AppImages.venue),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.to(() => const EventsView()),
                      child: categoryWidget("Event", AppImages.event),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // ---------- Tickets ----------
              sectionHeader(
                title: "Tickets",
                onViewAll: () => Get.to(() => const FeaturedTicketsView()),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: height * 0.20,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, __) => SizedBox(width: 12.w),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => const TicketDetailsView()),
                      child: SizedBox(
                        width: width * 0.90,
                        child: const TicketWidget(type: 'View Ticket'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Helper Widget ----------
  Widget categoryWidget(String txt, String imgUrl) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .1,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imgUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
          CustomBlurBgContainer(
            blurSigma: 1,
            width: width,
            padding: const EdgeInsets.all(10),
            body: Center(
              child: CustomText(
                text: txt,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: AppColors.pTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Reusable Section Header ----------
  Widget sectionHeader({
    required String title,
    required VoidCallback onViewAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, style: Theme.of(context).textTheme.titleMedium),
        CustomTextButton(
          text: "View All",
          onPressed: onViewAll,
          textStyle: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
