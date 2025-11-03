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
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
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
              text: 'Tickets',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 16),
            TabBar(
              controller: _tabController,

              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(text: "TODAY"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(text: "UPCOMING"),
                ),
              ],
              indicatorColor: AppColors.whiteColor.withOpacity(.5),
            ),
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
