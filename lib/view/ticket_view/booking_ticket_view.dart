import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_blur_bg_container.dart';
import 'package:makachi_connect/res/components/custom_drop_down.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

import '../../res/app_colors.dart';
import '../../res/components/custom_network_image.dart';

class BookingTicketView extends StatefulWidget {
  const BookingTicketView({super.key});

  @override
  State<BookingTicketView> createState() => _BookingTicketViewState();
}

class _BookingTicketViewState extends State<BookingTicketView> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Booking Ticket"),
          SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(AppPaddings.bodyPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomBlurBgContainer(
                      blurSigma: 10,
                      body: Column(
                        children: [
                          Row(
                            children: [
                              CustomNetworkImage(
                                imageUrl: "imageUrl",
                                height: width * .22,
                                width: width * .22,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "DJ Maksmellow Orignawa",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: AppColors.pTextColor,
                                          ),
                                    ),
                                    SizedBox(height: 5),
                                    isTile(
                                      Icons.calendar_month,
                                      "14 July, 2025",
                                    ),
                                    isTile(
                                      Icons.place_outlined,
                                      "36 Guild Street California, USA",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          divider(),
                          CustomDropdown(
                            label: "Number of Tickets",
                            hintText: "Select preferred number",
                            items: ["1", "2", "3", "4", "5", "6"],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomText(text: "Ticket Type"),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ticketType(
                        title: "Regular Ticket",
                        amount: "\$50.00",
                        available: "542 Ticket Available",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ticketType({
    required String title,
    required String amount,
    required String available,
  }) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.all(AppPaddings.bodyPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomBlurBgContainer(
        blurSigma: 10,
        body: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.ticketSvg),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.pTextColor),
                      ),
                      SizedBox(height: 5),
                      CustomText(
                        text: amount,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.pTextColor.withOpacity(.6),
                        ),
                      ),
                      CustomText(
                        text: available,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.pTextColor.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCheck = !isCheck;
                    });
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.blackColor.withOpacity(.5),
                    child: isCheck
                        ? Icon(
                            Icons.check,
                            color: AppColors.whiteColor.withOpacity(.7),
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Column(
      children: [
        SizedBox(height: 10),
        Divider(thickness: .2),
        SizedBox(height: 10),
      ],
    );
  }

  Widget isTile(IconData iconString, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(iconString, color: AppColors.whiteColor.withOpacity(.8), size: 18),
        SizedBox(width: 10),
        Flexible(
          child: CustomText(
            text: title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.pTextColor.withOpacity(.6),
            ),
          ),
        ),
      ],
    );
  }
}
