import 'package:flutter/cupertino.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/vendor_view/v_home_view/widget/recent_booking_widget.dart';

class RecentBookingView extends StatelessWidget {
  const RecentBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Recent Booking"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.bodyPadding),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: RecentBookingWidget(),
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
