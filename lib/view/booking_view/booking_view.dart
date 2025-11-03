import 'package:flutter/material.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/booking_view/widget/cancel_widget.dart';
import 'package:makachi_connect/view/booking_view/widget/completed_widget.dart';
import 'package:makachi_connect/view/booking_view/widget/scheduled_widget.dart';

import '../../res/app_colors.dart';
import '../../res/components/custom_text.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with two tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose TabController to avoid memory leaks
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EllipsisScaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomText(
              text: 'Booking',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 8),
            TabBar(
              controller: _tabController,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(text: "Scheduled"),
                ),
                CustomText(text: "Completed"),
                CustomText(text: "Cancel"),
              ],
              indicatorColor: AppColors.whiteColor.withOpacity(.5),
            ),

            // TabBarView to display content based on the selected tab
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ScheduledWidget(),
                  CompletedWidget(),
                  CancelWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
