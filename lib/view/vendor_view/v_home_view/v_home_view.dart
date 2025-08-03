import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_text_button.dart';
import 'package:makachi_connect/res/components/custom_network_image.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/vendor_view/v_home_view/recent_booking_view.dart';
import 'package:makachi_connect/view/vendor_view/v_home_view/widget/recent_booking_widget.dart';

class VHomeView extends StatefulWidget {
  const VHomeView({super.key});

  @override
  State<VHomeView> createState() => _VHomeViewState();
}

class _VHomeViewState extends State<VHomeView> {
  @override
  Widget build(BuildContext context) {
    return EllipsisScaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPaddings.bodyPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomNetworkImage(
                  imageUrl: "imageUrl",
                  height: 48.w,
                  width: 48.w,
                  borderRadius: BorderRadius.circular(48.w),
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.placemark_fill,
                      color: AppColors.primaryColor,
                      size: 18.sp,
                    ),
                    SizedBox(width: 6.w),
                    CustomText(
                      text: "California",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.whiteColor,
                      size: 20.sp,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.whiteColor.withOpacity(.5),
                    ),
                    borderRadius: BorderRadius.circular(50.w),
                  ),
                  child: Icon(
                    Icons.notifications_none,
                    color: AppColors.whiteColor,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                text: "Dashboard",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: totalCard(
                    title: "Total Booking",
                    amount: '50',
                    rating: '4',
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: totalCard(
                    title: "Total Revenue",
                    amount: '100',
                    rating: '4',
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Recent Booking",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CustomTextButton(
                  text: "View All",
                  onPressed: () {
                    Get.to(() => RecentBookingView());
                  },
                  textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: RecentBookingWidget(),
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                text: "Quick Actions",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(height: 10.h),

            Row(
              children: [
                Expanded(
                  child: quickActionCard(
                    icon: CupertinoIcons.building_2_fill,
                    title: "Add New Venue",
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: quickActionCard(
                    icon: Icons.local_hospital,
                    title: "Add New Event",
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: quickActionCard(
                    icon: CupertinoIcons.tickets,
                    title: "Add Event Ticket",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget quickActionCard({required IconData icon, required String title}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.bodyPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.whiteColor.withOpacity(.05),
              child: Icon(icon, size: 30, color: AppColors.primaryColor),
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget totalCard({
    required String title,
    required String amount,
    required String rating,
  }) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.whiteColor.withOpacity(.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  text: title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: AppColors.whiteColor),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CustomText(
                      text: "Mar",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(width),
                      ),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: amount,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.whiteColor,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.stacked_line_chart,
                  size: 16.sp,
                  color: AppColors.blackColor,
                ),
                SizedBox(width: 6.w),
                CustomText(
                  text: "$rating%",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xFF4BB54B),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          CustomText(
            text: "From the last month",
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 12.sp,
              color: AppColors.whiteColor.withOpacity(.7),
            ),
          ),
        ],
      ),
    );
  }
}
