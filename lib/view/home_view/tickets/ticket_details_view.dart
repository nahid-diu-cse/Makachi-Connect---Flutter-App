import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_blur_bg_container.dart';
import 'package:makachi_connect/res/components/custom_network_image.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/view/ticket_view/booking_ticket_view.dart';
import 'package:makachi_connect/widget/address_widget.dart';

class TicketDetailsView extends StatefulWidget {
  const TicketDetailsView({super.key});

  @override
  State<TicketDetailsView> createState() => _TicketDetailsViewState();
}

class _TicketDetailsViewState extends State<TicketDetailsView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomNetworkImage(
                  imageUrl: "imageUrl",
                  width: width,
                  height: height * .35,
                ),
                Positioned(
                  top: 0,
                  child: CustomAppbar(
                    action: CustomBlurBgContainer(
                      width: width * .12,
                      body: Image.asset(AppIcons.heartIcon),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(AppPaddings.bodyPadding),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Event",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                  ),
                  SizedBox(height: 4),
                  CustomText(
                    text: "DJ Maksmellow Orignawa",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.pTextColor,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      CustomText(
                        text: "\$110.99 ",
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.pTextColor),
                      ),
                      SizedBox(height: 6),
                      CustomText(
                        text: "/ person",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.pTextColor.withOpacity(.7),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: .1),
                  tlTile(
                    AppIcons.calendar30x30Svg,
                    "26 July, 2025",
                    "Tuesday, 4:00PM - 9:00PM",
                  ),
                  SizedBox(height: 16),

                  tlTile(
                    AppIcons.location30x30Svg,
                    "Gala Convention Center",
                    "36 Guild Street California, USA",
                  ),
                  Divider(thickness: .1),
                  Row(
                    children: [
                      CustomNetworkImage(
                        imageUrl: "imageUrl",
                        width: width * .13,
                        height: width * .13,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Ashfak Sayem",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: AppColors.pTextColor.withOpacity(.84),
                                ),
                          ),
                          CustomText(
                            text: "Organizer",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: AppColors.pTextColor.withOpacity(.6),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(thickness: .2),
                  CustomText(
                    text: "About",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    text:
                        "Get ready for an unforgettable night of music Concert. Whether you're a longtime fan or just looking for a night out filled with rhythm and excitement, this concert promises powerful vocals, stunning instrumentals, and a crowd that knows how to have a good time. Doors open at [Time], and tickets are going fast — don't miss your chance to be part of this incredible experience!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Divider(thickness: .2),
                  AddressWidget(),
                  Divider(thickness: .2),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomButton(
                      onPressed: () {
                        Get.to(() => BookingTicketView());
                      },
                      text: "Buy Ticket",
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tlTile(String iconString, String title, String subTitle) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: width * .13,
              width: width * .13,
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(),
            ),
            SvgPicture.asset(
              iconString,
              width: width * .08,
              height: width * .08,
            ),
          ],
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.pTextColor.withOpacity(.84),
              ),
            ),
            CustomText(
              text: subTitle,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.pTextColor.withOpacity(.6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
