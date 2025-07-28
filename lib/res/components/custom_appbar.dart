import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/components/custom_text.dart';

class CustomAppbar extends StatelessWidget {
  final String? title;
  final Widget? action;

  const CustomAppbar({super.key, this.title, this.action});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button on the left
              GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.asset(AppIcons.arrowBackSvg),
              ),
              // Expanded widget to center the title
              Expanded(
                child: Center(
                  child: CustomText(
                    text: title ?? "",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium, // Optional: Customize text style
                  ),
                ),
              ),
              // Action widget on the right (if any)
              action ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
