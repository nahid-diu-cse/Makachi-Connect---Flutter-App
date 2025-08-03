import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/buttons/custom_button.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/vendor_view/v_add_view/v_add_view.dart';
import 'package:makachi_connect/view/vendor_view/v_listing_view/widget/listing_widget.dart';

class VListingView extends StatefulWidget {
  const VListingView({super.key});

  @override
  State<VListingView> createState() => _VListingViewState();
}

class _VListingViewState extends State<VListingView> {
  void _showAddNewBottomSheet() {
    double width = MediaQuery.of(context).size.width;
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Add New Listing",
      barrierColor: Colors.black.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          children: [
            // Blurred background
            GestureDetector(
              onTap: () => Get.back(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  color: Colors.black.withOpacity(
                    0,
                  ), // keep transparent for blur to show
                ),
              ),
            ),

            // Bottom sheet-like container
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: AppColors.bgColor,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: "Choose One",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Expanded(
                              child: quickActionCard(
                                icon: CupertinoIcons.building_2_fill,
                                title: "Add New Venue",
                                onTap: () {
                                  Get.to(()=>VAddView(title: "Venue"));

                                },
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: quickActionCard(
                                icon: Icons.local_hospital,
                                title: "Add New Event",
                                onTap: () {
                                  Get.to(()=>VAddView(title: "Event"));

                                },
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: quickActionCard(
                                icon: CupertinoIcons.tickets,
                                title: "Add Event Ticket",
                                onTap: () {
                                  Get.to(()=>VAddView(title: "Ticket"));
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        CustomButton(
                          onPressed: () {},
                          text: "Next",
                          width: width,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.bodyPadding),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ListingWidget(),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPaddings.bodyPadding),
            child: CustomButton(
              width: width,
              onPressed: _showAddNewBottomSheet,
              text: "Add New",
              icon: CupertinoIcons.add,
            ),
          ),
        ],
      ),
    );
  }

  Widget quickActionCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPaddings.bodyPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.whiteColor.withOpacity(.05),
                child: Icon(icon, size: 30, color: AppColors.primaryColor),
              ),
              SizedBox(height: 10.h),
              CustomText(
                text: title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
