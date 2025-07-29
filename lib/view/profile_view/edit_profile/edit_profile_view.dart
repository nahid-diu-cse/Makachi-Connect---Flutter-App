import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_drop_down.dart';
import 'package:makachi_connect/res/components/custom_input_field.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

import '../../../res/app_colors.dart';
import '../../../res/components/custom_blur_bg_container.dart';
import '../../../res/components/custom_network_image.dart';
import '../../../res/components/custom_text.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Edit Profile"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppPaddings.bodyPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipOval(
                          child: CustomNetworkImage(
                            imageUrl: "imageUrl",
                            height: width * .25,
                            width: width * .25,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ClipOval(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.bgColor.withOpacity(.5),
                              ),
                              child: CustomBlurBgContainer(
                                body: Icon(
                                  Icons.camera_alt_outlined,
                                  color: AppColors.whiteColor.withOpacity(.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomText(
                      text: "Change Profile Picture",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.pTextColor.withOpacity(.7),
                      ), // Optional: Customize text style
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                      label: "Name",
                      hintText: "Adaoracosmetics",
                    ),
                    SizedBox(height: 10),
                    CustomInputField(label: "Email", hintText: "chi@gmail.com"),
                    SizedBox(height: 10),
                    CustomInputField(label: "Location", hintText: "California"),
                    SizedBox(height: 10),
                    CustomDropdown(
                      label: "Gender",
                      hintText: "Choose Gender",
                      items: ["Male", "Female", "Custom"],
                      enabled: true,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    SizedBox(height: 40),
                    CustomButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: "Save",
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
}
