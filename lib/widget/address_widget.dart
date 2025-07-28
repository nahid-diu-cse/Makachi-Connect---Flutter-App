import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/app_colors.dart';
import '../res/app_icons.dart';
import '../res/components/custom_text.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({super.key});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColors.pTextColor.withOpacity(.84),
                              ),
                        ),
                      ],
                    ),
                    CustomText(
                      text: "44A Street, California, USA",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.pTextColor.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
}
