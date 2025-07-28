import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_check_box.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

import '../../res/app_colors.dart';
import '../../res/app_images.dart';
import '../../res/components/custom_text.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isUser = false;

  bool isVendor = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(),
          Padding(
            padding: const EdgeInsets.all(AppPaddings.bodyPadding),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.logo,
                    height: width * .3,
                    width: width * .3,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomText(
                    text: "Sign Up",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.9),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomText(
                    text: "Create an account to continue!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 20),
                checkBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget checkBox() {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isUser,
          onChanged: (value) {
            isUser = value;
            isVendor = false;
            setState(() {

            });
          },
          label: "User",
        ),
        SizedBox(width: 50),
        CustomCheckBox(
          isChecked: isVendor,
          onChanged: (value) {
            isUser = false;
            isVendor = value;
            setState(() {

            });
          },
          label: "Vendor",
        ),
      ],
    );
  }
}
