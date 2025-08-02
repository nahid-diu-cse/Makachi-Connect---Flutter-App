import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_check_box.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

class CancellationReasonView extends StatefulWidget {
  const CancellationReasonView({super.key});

  @override
  State<CancellationReasonView> createState() => _CancellationReasonViewState();
}

class _CancellationReasonViewState extends State<CancellationReasonView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Cancel Booking"),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppPaddings.bodyPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  CustomText(
                    text: "Please select the reason for cancellation",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  SizedBox(height: 20.h),
                  checkText(
                    isChecked: true,
                    onChanged: (value) {},
                    text: "I have better deal",
                  ),
                  checkText(
                    isChecked: true,
                    onChanged: (value) {},
                    text: "Some other work, can't come",
                  ),
                  checkText(
                    isChecked: true,
                    onChanged: (value) {},
                    text: "I want to book another event",
                  ),
                  checkText(
                    isChecked: true,
                    onChanged: (value) {},
                    text: "Venue location is too far from my location",
                  ),
                  checkText(
                    isChecked: true,
                    onChanged: (value) {},
                    text: "Another reason",
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: width,
                    height: height * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.whiteColor.withOpacity(.5),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  CustomButton(onPressed: () {}, text: "Submit", width: width),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget checkText({
    required bool isChecked,
    required ValueChanged onChanged,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CustomCheckBox(
            isChecked: isChecked,
            onChanged: onChanged,
            borderRadius: 50,
          ),
          SizedBox(width: 20),
          CustomText(text: text, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
