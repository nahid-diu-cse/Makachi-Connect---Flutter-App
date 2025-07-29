import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Notifications"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppPaddings.bodyPadding),
              child: Container(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Today",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: index == 4 ? 0 : 12.0,
                            ),
                            child: notification(),
                          );
                        },
                      ),
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

  Widget notification() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.whiteColor.withOpacity(.05),
          child: Icon(
            Icons.email_outlined,
            color: AppColors.whiteColor.withOpacity(.7),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text:
                    "Your booking request for Sunset Bay Hall has been confirmed!",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.whiteColor.withOpacity(.7),
                ),
              ),
              SizedBox(height: 10),
              CustomText(
                text: "11:00 AM",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.whiteColor.withOpacity(.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
