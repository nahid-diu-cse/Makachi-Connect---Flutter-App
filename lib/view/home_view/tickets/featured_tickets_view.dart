import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/home_view/tickets/ticket_details_view.dart';
import 'package:makachi_connect/widget/ticket_widget.dart';

class FeaturedTicketsView extends StatefulWidget {
  const FeaturedTicketsView({super.key});

  @override
  State<FeaturedTicketsView> createState() => _FeaturedTicketsViewState();
}

class _FeaturedTicketsViewState extends State<FeaturedTicketsView> {
  @override
  Widget build(BuildContext context) {
    return EllipsisScaffold(
      body: Column(
        children: [
          CustomAppbar(title: "Tickets"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPaddings.bodyPadding),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == 4 ? 0 : 16.0),
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
          ),
        ],
      ),
    );
  }
}
