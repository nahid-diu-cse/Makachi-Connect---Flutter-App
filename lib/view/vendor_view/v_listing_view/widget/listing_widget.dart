import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_icons.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/components/custom_network_image.dart';
import '../../../../res/components/custom_text.dart';

class ListingWidget extends StatefulWidget {
  const ListingWidget({super.key});

  @override
  State<ListingWidget> createState() => _ListingWidgetState();
}

class _ListingWidgetState extends State<ListingWidget> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
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
      padding: EdgeInsets.all(8),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: title,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.edit,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.delete_forever_outlined,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: iconText(Icons.wallet_giftcard, "\$$amount"),
                    ),
                    Row(
                      children: [
                        iconText(Icons.star_border_outlined, rating),
                        SizedBox(width: 5.w),
                        iconText(Icons.people_alt_outlined, people),
                      ],
                    ),
                    SizedBox(width: 5.w),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppIcons.dotIcon),
                        SizedBox(width: 6.w),
                        CustomText(
                          text: 'Available',
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(color: AppColors.greenColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget iconText(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.whiteColor.withOpacity(.5)),
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
