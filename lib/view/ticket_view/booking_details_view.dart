import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/bottom_nav_bar/bottom_nav_bar.dart';

import '../../res/app_colors.dart';
import '../../res/components/custom_blur_bg_container.dart';
import '../../res/components/custom_network_image.dart';
import '../../res/components/custom_text.dart';
import '../../res/components/xela_divider.dart';
import '../../res/enum/enum.dart';

class BookingDetailsView extends StatefulWidget {
  const BookingDetailsView({super.key});

  @override
  State<BookingDetailsView> createState() => _BookingDetailsViewState();
}

class _BookingDetailsViewState extends State<BookingDetailsView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Booking Details"),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(AppPaddings.bodyPadding),
                child: Column(
                  children: [
                    Container(
                      width: width,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomNetworkImage(
                            imageUrl: "imageUrl",
                            height: height * .3,
                            width: width,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          SizedBox(height: 10),
                          CustomText(
                            text: "DJ Maksmellow Orignawa",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.location30x30Svg,
                                height: 24,
                                width: 24,
                              ),
                              CustomText(
                                text: "36 Guild Street California, USA",
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(
                                      color: AppColors.pTextColor.withOpacity(
                                        .7,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: width,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Ticket Schedule",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          divider(),
                          tlTile(text: "Date", description: "Aug 24, 2025"),
                          tlTile(text: "Time", description: "4:00 - 9:00 PM"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: width,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Price Details",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          divider(),
                          tlTile(
                            text: "1x Ticket Price",
                            description: "\$50.00",
                          ),
                          tlTile(text: "Subtotal", description: "\$50.00"),
                          SizedBox(height: 10),
                          XelaDivider(
                            style: XelaDividerStyle.DOTTED,
                            orientation: XelaDividerOrientation.HORIZONTAL,
                            color: AppColors.whiteColor.withOpacity(.7),
                          ),
                          SizedBox(height: 10),

                          tlTile(text: "Total", description: "\$50.00"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      onPressed: () {
                        Get.to(() => BottomNavBar());
                      },
                      text: "Checkout",
                      width: width,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tlTile({required String text, required String description}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.pTextColor.withOpacity(.6),
          ),
        ),
        CustomText(
          text: description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.pTextColor.withOpacity(.8),
          ),
        ),
      ],
    );
  }

  Widget divider() {
    return Column(
      children: [
        SizedBox(height: 10),
        Divider(thickness: .3),
        SizedBox(height: 10),
      ],
    );
  }
}
