import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_check_box.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/auth_view/verification_view.dart';

import '../../res/app_colors.dart';
import '../../res/app_icons.dart';
import '../../res/app_images.dart';
import '../../res/components/buttons/custom_button.dart';
import '../../res/components/buttons/custom_text_button.dart';
import '../../res/components/custom_divider_text.dart';
import '../../res/components/custom_input_field.dart';
import '../../res/components/custom_text.dart';
import '../../res/enum/enum.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isUser = true;
  bool isVendor = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
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
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(
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
                    SizedBox(height: 20),
                    CustomInputField(
                      label: "Name",
                      hintText: "Adaoracosmetics",
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                      label: "Email",
                      hintText: "chine@gmail.com",
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                      label: "Location",
                      hintText: "California",
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomInputField(
                      label: "Password",
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
                    SizedBox(height: 20),
                    CustomButton(
                      onPressed: () {
                        Get.to(() => VerificationView());
                      },
                      text: "Sign Up",
                      width: width,
                    ),
                    SizedBox(height: 20),
                    CustomDividerText(
                      text: "Sign in with",
                      lineColor: AppColors.whiteColor.withOpacity(.4),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        CustomButton(
                          onPressed: () {},
                          imagePath: AppIcons.googleSvg,
                          imageType: ImageType.svg,
                          text: "Continue with Google",
                          width: width,
                          backgroundColor: AppColors.whiteColor.withOpacity(.1),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          onPressed: () {},
                          imagePath: AppIcons.appleSvg,
                          imageType: ImageType.svg,
                          text: "Continue with Apple",
                          width: width,
                          backgroundColor: AppColors.whiteColor.withOpacity(.1),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Don't have an account?",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            CustomTextButton(
                              text: "Sign Up",
                              onPressed: () {
                                Get.to(() => SignUpView());
                              },
                              textStyle: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ],
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

  Widget checkBox() {
    return Row(
      children: [
        CustomCheckBox(
          borderRadius: 50,
          activeColor: AppColors.primaryColor,
          borderColor: isUser
              ? AppColors.primaryColor
              : AppColors.whiteColor.withOpacity(.5),

          isChecked: isUser,
          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: isUser ? AppColors.primaryColor : AppColors.pTextColor,
          ),
          onChanged: (value) {
            isUser = value;
            isVendor = false;
            setState(() {});
          },
          label: "User",
        ),
        SizedBox(width: 50),
        CustomCheckBox(
          borderRadius: 50,

          activeColor: AppColors.primaryColor,
          borderColor: isVendor
              ? AppColors.primaryColor
              : AppColors.whiteColor.withOpacity(.5),
          isChecked: isVendor,
          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: isVendor ? AppColors.primaryColor : AppColors.pTextColor,
          ),
          onChanged: (value) {
            isUser = false;
            isVendor = value;
            setState(() {});
          },
          label: "Vendor",
        ),
      ],
    );
  }
}
