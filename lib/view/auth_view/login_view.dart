import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/app_images.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/buttons/custom_text_button.dart';
import 'package:makachi_connect/res/components/custom_check_box.dart';
import 'package:makachi_connect/res/components/custom_divider_text.dart';
import 'package:makachi_connect/res/components/custom_input_field.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/res/enum/enum.dart';
import 'package:makachi_connect/view/auth_view/forget_pass_view.dart';
import 'package:makachi_connect/view/auth_view/sign_up_view.dart';
import 'package:makachi_connect/view/home_view/enable_location_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isChecked = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Container(
        padding: EdgeInsets.all(AppPaddings.bodyPadding),
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                    text: "Sign in to your Account",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.9),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomText(
                    text: "Enter your email and password to log in",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),

            Column(
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCheckBox(
                      isChecked: isChecked,
                      activeColor: Colors.transparent,
                      size: 20,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                      label: "Remember me",
                    ),
                    CustomTextButton(
                      padding: EdgeInsets.all(0),
                      text: "Forgot Password?",
                      onPressed: () => Get.to(() => ForgetPassView()),
                      textStyle: Theme.of(context).textTheme.bodyMedium!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    Get.to(() => EnableLocationView());
                  },
                  text: "Login",
                  width: width,
                ),
              ],
            ),
            CustomDividerText(
              text: "Sign in with",
              lineColor: AppColors.whiteColor.withOpacity(.4),
            ),
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
    );
  }
}
