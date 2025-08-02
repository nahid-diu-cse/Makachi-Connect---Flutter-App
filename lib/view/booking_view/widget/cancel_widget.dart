import 'package:flutter/cupertino.dart';
import 'package:makachi_connect/res/app_paddings.dart';

import '../../../res/components/custom_text.dart';
import '../../../widget/booking_widget.dart';

class CancelWidget extends StatelessWidget {
  const CancelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(AppPaddings.bodyPadding),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: index == 4 ? 0 : 16.0),
            child: BookingWidget(
              bookingStatus: "cancel",
              hgt: height * .3,
              wdt: width,
              isAllVenueList: true,
            ),
          );
        },
      ),
    );
  }
}
