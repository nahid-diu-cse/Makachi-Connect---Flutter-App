import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/home_view/featured_venues/venue_details_view.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_icons.dart';
import '../../../res/app_paddings.dart';
import '../../../res/components/custom_appbar.dart';
import '../../../res/components/custom_blur_bg_container.dart';
import '../../../res/components/custom_network_image.dart';
import '../../../res/components/custom_text.dart';

class VenuesView extends StatefulWidget {
  const VenuesView({super.key});

  @override
  State<VenuesView> createState() => _VenuesViewState();
}

class _VenuesViewState extends State<VenuesView> {
  @override
  Widget build(BuildContext context) {
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Venues"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.bodyPadding),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(() => VenueDetailsView()),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: index == 4 ? 0 : 16.0),
                      child: eventCard(
                        imgUrl: "imgUrl",
                        title: "Grand Elegance Hall",
                        amount: "8,500",
                        rating: '5.0 (169)',
                        people: '250',
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
    required String amount,
    required String rating,
    required String people,
  }) {
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
                  iconText(Icons.wallet_giftcard, "\$$amount"),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      iconText(Icons.star_border_outlined, rating),
                      SizedBox(width: 20),
                      iconText(Icons.people_alt_outlined, people),
                    ],
                  ),
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
