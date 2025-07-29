import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../res/app_paddings.dart';
import '../../../widget/ticket_widget.dart';
import '../../home_view/tickets/ticket_details_view.dart';

class UpcommingTicket extends StatelessWidget {
  const UpcommingTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.bodyPadding),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == 4 ? 0 : 16.0,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => TicketDetailsView());
                },
                child: TicketWidget(),
              ),
            );
          },
        ),
      ),
    );
  }
}
