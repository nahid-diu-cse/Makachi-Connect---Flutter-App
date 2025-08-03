import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_check_box.dart';
import 'package:makachi_connect/res/components/custom_input_field.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

class VAddView extends StatefulWidget {
  final String title;

  const VAddView({super.key, required this.title});

  @override
  State<VAddView> createState() => _VAddViewState();
}

class _VAddViewState extends State<VAddView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Add ${widget.title}"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.bodyPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Upload Image",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10.h),
                    uploadContainer(height: height * .17, onTap: () {}),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: uploadContainer(
                            height: height * .1,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: uploadContainer(
                            height: height * .1,
                            onTap: () {},
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: uploadContainer(
                            height: height * .1,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomText(
                      text: "${widget.title} Details",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 20.h),
                    CustomInputField(
                      label: "${widget.title} Name",
                      hintText: "Type your ${widget.title.toLowerCase()} name",
                    ),
                    SizedBox(height: 10.h),
                    CustomInputField(
                      label: "${widget.title} Description",
                      maxLines: 3,
                      hintText:
                          "Type your ${widget.title.toLowerCase()} Description",
                    ),
                    SizedBox(height: 10.h),
                    CustomInputField(
                      label: "Location",
                      hintText:
                          "Type your ${widget.title.toLowerCase()} location",
                    ),
                    SizedBox(height: 10.h),
                    widget.title != "Venue"
                        ? Center()
                        : CustomInputField(
                            label: "${widget.title} Capacity",
                            hintText:
                                "Type your ${widget.title.toLowerCase()} capacity",
                          ),
                    widget.title!="Venue"?Center():SizedBox(height: 10.h),
                    widget.title != "Venue"
                        ? Center()
                        : CustomInputField(
                            label: "${widget.title} Area Size",
                            hintText:
                                "Type your ${widget.title.toLowerCase()} Area Size",
                          ),
                    widget.title!="Venue"?Center():SizedBox(height: 10.h),
                    CustomInputField(
                      label: "${widget.title} Price",
                      hintText: "Type your ${widget.title.toLowerCase()} Price",
                    ),
                    widget.title!="Venue"?Center():SizedBox(height: 10.h),
                    widget.title != "Venue"
                        ? Center()
                        : CustomInputField(
                            label: "${widget.title} Availability",
                            hintText:
                                "Type your ${widget.title.toLowerCase()} Availability",
                          ),
                    widget.title != "Venue" ? Center() : SizedBox(height: 20.h),
                    widget.title != "Venue"
                        ? Center()
                        : CustomText(
                            text: "Include Services",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                    widget.title != "Venue" ? Center() : SizedBox(height: 10.h),
                    widget.title != "Venue"
                        ? Center()
                        : CustomCheckBox(
                            isChecked: false,
                            size: 15,
                            onChanged: (value) {},
                            label: "Dj Service",
                            labelStyle: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: AppColors.whiteColor.withOpacity(.5),
                                ),
                          ),
                    widget.title != "Venue"
                        ? Center()
                        : CustomCheckBox(
                            isChecked: false,
                            size: 15,
                            onChanged: (value) {},
                            label: "Decoration",
                            labelStyle: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: AppColors.whiteColor.withOpacity(.5),
                                ),
                          ),
                    widget.title != "Venue"
                        ? Center()
                        : CustomCheckBox(
                            isChecked: false,
                            size: 15,
                            onChanged: (value) {},
                            label: "Catering",
                            labelStyle: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: AppColors.whiteColor.withOpacity(.5),
                                ),
                          ),

                    SizedBox(height: 30.h),
                    CustomButton(
                      onPressed: () {},
                      text: "Publish",
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

  Widget uploadContainer({
    required double height,
    required VoidCallback onTap,
  }) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.whiteColor.withOpacity(.5)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.add,
                color: AppColors.whiteColor.withOpacity(.7),
              ),
              SizedBox(height: 10),
              CustomText(
                text: "Upload",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.whiteColor.withOpacity(.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
