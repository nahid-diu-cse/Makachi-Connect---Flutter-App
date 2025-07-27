import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_blur_bg_container.dart';
import 'package:makachi_connect/res/components/custom_network_image.dart';
import 'package:makachi_connect/res/components/custom_rating_bar.dart';
import 'package:makachi_connect/res/components/custom_text.dart';

import '../../../res/app_images.dart';

class VenueDetailsView extends StatefulWidget {
  const VenueDetailsView({super.key});

  @override
  State<VenueDetailsView> createState() => _VenueDetailsViewState();
}

class _VenueDetailsViewState extends State<VenueDetailsView> {
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
                    text: "Venue",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                  ),
                  SizedBox(height: 4),
                  CustomText(
                    text: "Neon Party",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.pTextColor,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.locationSvg),
                      SizedBox(width: 4),
                      CustomText(
                        text: "Downtown Manhattan, New York",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.pTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),

                  Row(
                    children: [
                      CustomRatingBar(
                        onRatingUpdate: (value) {},
                        rating: 3,
                        itemSize: 20,
                      ),
                      SizedBox(width: 10),
                      CustomText(
                        text: "(128)",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.pTextColor,
                        ),
                      ),
                    ],
                  ),
                  divider(),
                  Row(
                    children: [
                      Expanded(
                        child: tlTile(Icons.people, "Capacity", "Up to 300"),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: tlTile(
                          Icons.monetization_on,
                          "Price Range",
                          "\$8,500",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: tlTile(Icons.scale, "Area Size", "5,000 sq ft"),
                      ),

                      SizedBox(width: 10),

                      Expanded(
                        child: tlTile(
                          Icons.calendar_month,
                          "Available",
                          "Next 30 days",
                        ),
                      ),
                    ],
                  ),
                  divider(),
                  labelText("Include Services"),
                  Row(
                    children: [
                      Expanded(
                        child: isTile(
                          CupertinoIcons.music_note_2,
                          "DJ Services",
                        ),
                      ),

                      SizedBox(width: 10),

                      Expanded(child: isTile(Icons.color_lens, "Decoration")),

                      SizedBox(width: 10),

                      Expanded(child: isTile(Icons.kitchen, "Catering")),
                    ],
                  ),
                  divider(),
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
                  divider(),
                  labelText("About"),
                  CustomText(
                    text:
                        "Get ready for an unforgettable night of music Concert. Whether you're a longtime fan or just looking for a night out filled with rhythm and excitement, this concert promises powerful vocals, stunning instrumentals, and a crowd that knows how to have a good time. Doors open at [Time], and tickets are going fast — don't miss your chance to be part of this incredible experience!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  divider(),
                  labelText("Address"),
                  Stack(
                    children: [
                      Container(
                        height: height * .2,
                        width: width,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor.withOpacity(.05),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: width,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor.withOpacity(.05),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.locationSvg,
                                    height: 20,
                                    width: 20,
                                  ),
                                  CustomText(
                                    text: "Location",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: AppColors.pTextColor
                                              .withOpacity(.84),
                                        ),
                                  ),
                                ],
                              ),
                              CustomText(
                                text: "44A Street, California, USA",
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(
                                      color: AppColors.pTextColor.withOpacity(
                                        .6,
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  divider(),
                  labelText("User’s feedback"),
                  feedback(
                    "userImage",
                    "McKenna T.",
                    3.5,
                    "I highly recommend this swapper for anyone in need of a reliable service. My overall experience with it has been exceptionally positive.",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              width: width,
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(.05),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Total Price",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.pTextColor.withOpacity(.6),
                        ),
                      ),
                      CustomText(
                        text: "\$8,500",

                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              color: AppColors.pTextColor.withOpacity(.84),
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomButton(onPressed: () {}, text: "Book Now"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget feedback(
    String userImage,
    String userName,
    double rating,
    String description,
  ) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: CustomNetworkImage(
            imageUrl: userImage,
            width: width * .1,
            height: width * .1,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: userName),
              CustomRatingBar(
                onRatingUpdate: (value) {},
                itemSize: 20,
                rating: 5,
              ),
              SizedBox(height: 10),
              CustomText(
                text: description,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.pTextColor.withOpacity(.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget labelText(String txt) {
    return Column(
      children: [
        CustomText(text: txt, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 10),
      ],
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

  Widget tlTile(IconData iconString, String title, String subTitle) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(iconString, color: AppColors.whiteColor),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.pTextColor.withOpacity(.6),
                ),
              ),
              CustomText(
                text: subTitle,

                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.pTextColor.withOpacity(.84),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget isTile(IconData iconString, String title) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(.05),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconString,
            color: AppColors.whiteColor.withOpacity(.8),
            size: 35,
          ),
          CustomText(
            maxLines: 1,
            text: title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.pTextColor.withOpacity(.6),
            ),
          ),
        ],
      ),
    );
  }
}
