import 'package:flutter/material.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/widget/event_widget.dart';

class FeaturedEventsView extends StatelessWidget {
  const FeaturedEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return EllipsisScaffold(
      body: Container(
        padding: EdgeInsets.all(AppPaddings.bodyPadding),
        child: Column(
          children: [
            CustomAppbar(title: "Featured Events"),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 4 ? 0 : 16),
                    child: EventWidget(
                      hgt: height * .3,
                      wdt: width,
                      isAllEventList: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
