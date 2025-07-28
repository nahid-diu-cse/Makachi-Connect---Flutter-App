import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_blur_bg_container.dart';
import 'package:makachi_connect/res/components/custom_network_image.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/home_view/featured_events/event_details_view.dart';

import '../../../res/app_icons.dart';

class EventsView extends StatefulWidget {
  const EventsView({super.key});

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Events"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.bodyPadding),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(() => EventDetailsView()),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: index == 4 ? 0 : 16.0),
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
