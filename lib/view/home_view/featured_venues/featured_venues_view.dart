import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/home_view/featured_venues/venue_details_view.dart';
import 'package:makachi_connect/widget/event_widget.dart';
import 'package:makachi_connect/widget/venue_widget.dart';

class FeaturedVenuesView extends StatelessWidget {
  const FeaturedVenuesView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Featured Vanues"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.bodyPadding),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 4 ? 0 : 16),
                    child: GestureDetector(
                      onTap: () => Get.to(() => VenueDetailsView()),
                      child: VenueWidget(
                        hgt: height * .3,
                        wdt: width,
                        isAllVanueList: true,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
