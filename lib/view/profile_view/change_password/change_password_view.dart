import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

import '../../../res/components/custom_input_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Change Password"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppPaddings.bodyPadding),
              child: Column(
                children: [
                  CustomInputField(
                    label: "Current Password",
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
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
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
                  SizedBox(height: 30),

                  CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: "Update",
                    width: width,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
