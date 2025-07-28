import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/components/buttons/custom_text_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/auth_view/password_change.dart';
import 'package:pinput/pinput.dart';

import '../../res/app_colors.dart';
import '../../res/app_paddings.dart';
import '../../res/components/buttons/custom_button.dart';
import '../../res/components/custom_input_field.dart';
import '../../res/components/custom_text.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                    text: "Verification Code",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.9),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomText(
                    text: "Please enter the code we just sent to your email",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.pTextColor.withOpacity(.7),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: height * .07),
                Pinput(
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(234, 239, 243, 1),
                      ),

                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: height * .04),
                CustomText(
                  text: "Didn’t receive OTP?",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.pTextColor.withOpacity(.7),
                  ),
                ),
                CustomTextButton(
                  text: "Resend Code",
                  onPressed: () {},
                  textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: height * .04),

                CustomButton(onPressed: () {

                  Get.to(()=>PasswordChange());
                }, text: "Verify", width: width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
