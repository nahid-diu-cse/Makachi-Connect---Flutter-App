import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/app_colors.dart';
import '../res/app_icons.dart';
import '../res/app_images.dart';
import '../res/components/buttons/custom_text_button.dart';
import '../res/components/custom_network_image.dart';
import '../res/components/custom_text.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({super.key});

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(24),
      height: height * .2,
      width: width * .8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.ticketCard),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomNetworkImage(
                imageUrl: "imageUrl",
                width: width * .12,
                height: width * .12,
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Music Jamming Outdoor",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.calenderSvg),
                        SizedBox(width: 5),
                        CustomText(
                          text: "07 Jun, 2025",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                            color: AppColors.pTextColor.withOpacity(.7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Time",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.pTextColor.withOpacity(.7),
                      ),
                    ),
                    CustomText(
                      maxLines: 1,
                      text: "10:00 PM",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Location",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.pTextColor.withOpacity(.7),
                      ),
                    ),
                    CustomText(
                      text: "California, CA",
                      maxLines: 1,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),

              CustomTextButton(
                backgroundColor: Color(0xFF121212),
                borderRadius: 30,
                padding: EdgeInsets.all(8),
                text: "Premium ticket x1",
                onPressed: () {},
                textStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
