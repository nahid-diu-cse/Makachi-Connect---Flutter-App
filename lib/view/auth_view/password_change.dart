import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/auth_view/login_view.dart';
import 'package:makachi_connect/view/auth_view/verification_view.dart';

import '../../res/app_colors.dart';
import '../../res/components/buttons/custom_button.dart';
import '../../res/components/custom_input_field.dart';
import '../../res/components/custom_text.dart';

class PasswordChange extends StatelessWidget {
  const PasswordChange({super.key});

  @override
  Widget build(BuildContext context) {
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
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomText(
                    text: "New Password",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.9),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomText(
                    text: "New password must different from previous",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 20),
                CustomInputField(
                  label: "New Password",
                  hintText: "*****",
                  isPassword: true,
                  prefixIcon: Icons.lock_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                    if (value.length < 6) return "Minimum 6 characters";
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomInputField(
                  label: "Confirm Password",
                  hintText: "*****",
                  isPassword: true,
                  prefixIcon: Icons.lock_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                    if (value.length < 6) return "Minimum 6 characters";
                    return null;
                  },
                ),
                SizedBox(height: 40),
                CustomButton(
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                  text: "Change Password",
                  width: width,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
