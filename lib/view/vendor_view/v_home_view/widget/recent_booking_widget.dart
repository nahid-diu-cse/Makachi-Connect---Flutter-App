import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/components/custom_network_image.dart';
import '../../../../res/components/custom_text.dart';
import '../../../home_view/featured_venues/venue_details_view.dart';

class RecentBookingWidget extends StatefulWidget {
  const RecentBookingWidget({super.key});

  @override
  State<RecentBookingWidget> createState() => _RecentBookingWidgetState();
}

class _RecentBookingWidgetState extends State<RecentBookingWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Get.to(() => VenueDetailsView()),
      child: bookingCard(
        imgUrl: "imgUrl",
        title: "Grand Elegance Hall",
        amount: "8,500",
        rating: '5.0 (169)',
        people: '250',
        onTap: () {},
      ),
    );
  }

  Widget bookingCard({
    required String imgUrl,
    required String title,
    required String amount,
    required String rating,
    required String people,
    required VoidCallback onTap,
  }) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomNetworkImage(
                imageUrl: imgUrl,
                height: width * .22,
                width: width * .22,
                borderRadius: BorderRadius.circular(15),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8),
                  iconText(Icons.wallet, "\$$amount"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconText(Icons.star_border_outlined, rating),
                      SizedBox(width: 5.w),
                      iconText(Icons.people_alt_outlined, people),
                      SizedBox(width: 5.w),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.greenColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: CustomText(
                          text: 'Confirmed',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: AppColors.greenColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
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
        Icon(icon, color: AppColors.whiteColor.withOpacity(.5), size: 18),
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
