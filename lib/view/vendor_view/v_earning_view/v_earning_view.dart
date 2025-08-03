import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/widget/line_chart_widget.dart';

class VEarningView extends StatefulWidget {
  const VEarningView({super.key});

  @override
  State<VEarningView> createState() => _VEarningViewState();
}

class _VEarningViewState extends State<VEarningView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Padding(
        padding: EdgeInsets.all(AppPaddings.bodyPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.whiteColor.withOpacity(.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: "Total Earnings",
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(color: AppColors.whiteColor),
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
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppColors.whiteColor),
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
                    text: "\$5000",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        CupertinoIcons.up_arrow,
                        color: AppColors.greenColor,
                      ),
                      CustomText(
                        text: "12.5%",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: const Color(0xFF4BB54B),
                              fontSize: 14.sp,
                            ),
                      ),
                      SizedBox(width: 10.w),
                      CustomText(
                        text: "from last month",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: "Monthly Earnings",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10.h),
            LineChartWidget(),
            SizedBox(height: 10.h),
            CustomText(
              text: "Recent Transactions",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: recentTransactionCard(isBooking: false),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget recentTransactionCard({required bool isBooking}) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  isBooking
                      ? CupertinoIcons.creditcard_fill
                      : CupertinoIcons.arrow_right_arrow_left,
                  size: width * .07,
                  color: AppColors.whiteColor,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Booking #2458",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomText(
                    text: "June 18, 2025",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.whiteColor.withOpacity(.7),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              CustomText(
                text: !isBooking ? "-" : "+",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isBooking
                      ? AppColors.greenColor
                      : AppColors.primaryColor,
                ),
              ),
              CustomText(
                text: "\$8,555.00",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isBooking
                      ? AppColors.greenColor
                      : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
