import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/view/booking_view/cancellation_reason_view.dart';
import 'package:makachi_connect/view/booking_view/review_view.dart';

import '../res/app_colors.dart';
import '../res/components/custom_network_image.dart';
import '../res/components/custom_text.dart';
import '../view/home_view/featured_venues/venue_details_view.dart';

class BookingWidget extends StatefulWidget {
  final double? hgt;
  final double? wdt;
  final bool isAllVenueList;
  final String bookingStatus;

  const BookingWidget({
    super.key,
    this.hgt,
    this.wdt,
    this.isAllVenueList = false,
    required this.bookingStatus,
  });

  @override
  State<BookingWidget> createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
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
        onTap: () {
          widget.bookingStatus == "scheduled"
              ? Get.to(() => CancellationReasonView())
              : Get.to(() => ReviewView());
          ;
        },
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
                height: width * .25,
                width: width * .25,
                borderRadius: BorderRadius.circular(15),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  iconText(Icons.wallet_giftcard, "\$$amount"),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconText(Icons.star_border_outlined, rating),
                      SizedBox(width: 5.w),
                      iconText(Icons.people_alt_outlined, people),
                      SizedBox(width: 5.w),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: CustomText(
                          text: widget.bookingStatus == "scheduled"
                              ? 'Paid'
                              : widget.bookingStatus == "completed"
                              ? 'Completed'
                              : 'Cancelled',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: AppColors.pTextColor,
                                fontSize: 11,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          widget.bookingStatus == "scheduled" ||
                  widget.bookingStatus == "completed"
              ? CustomButton(
                  onPressed: onTap,
                  text: widget.bookingStatus == "scheduled"
                      ? "Cancel Booking"
                      : "Add Review",
                  width: width,
                  backgroundColor: Colors.transparent,
                  borderSide: true,
                )
              : Center(),
        ],
      ),
    );
  }

  Widget iconText(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.whiteColor.withOpacity(.5), size: 20),
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
