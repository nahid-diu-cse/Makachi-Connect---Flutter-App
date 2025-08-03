import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_icons.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_blur_bg_container.dart';
import 'package:makachi_connect/res/components/custom_network_image.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/auth_view/login_view.dart';
import 'package:makachi_connect/view/profile_view/about_view.dart';
import 'package:makachi_connect/view/profile_view/change_password/change_password_view.dart';
import 'package:makachi_connect/view/profile_view/edit_profile/edit_profile_view.dart';
import 'package:makachi_connect/view/profile_view/notifications/notifications_view.dart';
import 'package:makachi_connect/view/profile_view/privacy_view.dart';
import 'package:makachi_connect/view/profile_view/terms_view.dart';
import 'package:makachi_connect/view/vendor_view/v_profile_view/v_makachi_premium_view.dart';
import 'package:makachi_connect/view/vendor_view/v_profile_view/v_rating_review_view.dart';

import '../../res/app_colors.dart';
import '../../res/components/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10.0),
                // You can adjust the blur strength here
                child: Container(
                  color: Colors.black.withOpacity(
                    0.3,
                  ), // Optional: dim the background
                ),
              ),
            ),
            AlertDialog(
              backgroundColor: AppColors.whiteColor.withOpacity(.05),
              elevation: 5,
              title: CustomText(text: 'Do you want to sign out your profile?'),
              alignment: Alignment.center,
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                CustomButton(
                  onPressed: () {
                    Get.back();
                  },
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  text: "No",
                ),
                CustomButton(
                  onPressed: () {
                    Get.offAll(() => LoginView());
                  },

                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),

                  text: "Yes",
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbar(title: "Profile", isLeading: false),

            Padding(
              padding: const EdgeInsets.all(AppPaddings.bodyPadding),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipOval(
                        child: CustomNetworkImage(
                          imageUrl: "imageUrl",
                          height: width * .3,
                          width: width * .3,
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
                    text: "Chine Romeo",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium, // Optional: Customize text style
                  ),
                  SizedBox(height: 20),

                  card(
                    icon: AppIcons.user,
                    text: "Edit Profile",
                    onTap: () {
                      Get.to(() => EditProfileView());
                    },
                  ),
                  SizedBox(height: 10),
                  card(
                    icon: AppIcons.key,
                    text: "Change Password",
                    onTap: () {
                      Get.to(() => ChangePasswordView());
                    },
                  ),
                  SizedBox(height: 10),
                  card(
                    icon: AppIcons.message,
                    text: "Rating & Reviews",
                    onTap: () {
                      Get.to(() => VRatingReviewView());
                    },
                  ),
                  SizedBox(height: 10),card(
                    icon: AppIcons.crown,
                    text: "Makachi Premium",
                    onTap: () {
                      Get.to(() => VMakachiPremiumView());
                    },
                  ),
                  SizedBox(height: 10),
                  card(
                    icon: AppIcons.notification,
                    text: "Notifications",
                    onTap: () {
                      Get.to(() => NotificationsView());
                    },
                  ),
                  SizedBox(height: 10),
                  card(
                    icon: AppIcons.about,
                    text: "About Us",
                    onTap: () {
                      Get.to(() => AboutView());
                    },
                  ),
                  SizedBox(height: 10),
                  card(
                    icon: AppIcons.privacy,
                    text: "Privacy Policy",
                    onTap: () {
                      Get.to(() => PrivacyView());
                    },
                  ),
                  SizedBox(height: 10),
                  card(
                    icon: AppIcons.terms,
                    text: "Terms of Services",
                    onTap: () {
                      Get.to(() => TermsView());
                    },
                  ),

                  SizedBox(height: 30),

                  CustomButton(
                    width: width,
                    onPressed: () {
                      _showSignOutDialog(context);
                    },
                    text: "Log Out",
                    trailingIcon: Icons.logout,
                    iconSize: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card({
    required String icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppPaddings.bodyPadding),
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(.05),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: 10),
                CustomText(
                  text: text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.whiteColor.withOpacity(.7),
                  ),
                ),
              ],
            ),
            SvgPicture.asset(AppIcons.arrowRight),
          ],
        ),
      ),
    );
  }
}
