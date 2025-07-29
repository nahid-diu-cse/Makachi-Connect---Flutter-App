import 'package:flutter/material.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/components/custom_text.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';
import 'package:makachi_connect/view/ticket_view/widget/today_ticket.dart';
import 'package:makachi_connect/view/ticket_view/widget/upcomming_ticket.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  _TicketViewState createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize TabController with two tabs
    _tabController = TabController(length: 2, vsync: this);
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
            SizedBox(height: 20),
            // TabBar with custom text for "TODAY" and "UPCOMING"
            TabBar(
              controller: _tabController,
              tabs: [
                CustomText(text: "TODAY"),
                CustomText(text: "UPCOMING"),
              ],
              indicatorColor: AppColors.whiteColor.withOpacity(.5),
            ),

            // TabBarView to display content based on the selected tab
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [TodayTicket(), UpcommingTicket()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
