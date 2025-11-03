import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/ticket_widget.dart';
import '../../home_view/tickets/ticket_details_view.dart';

class UpcommingTicket extends StatefulWidget {
  const UpcommingTicket({super.key});

  @override
  State<UpcommingTicket> createState() => _TodayTicketState();
}

class _TodayTicketState extends State<UpcommingTicket> {
  static const List<Map> ticketList = [
    {"id": 1, "ticket_type": "VIP Ticket x1"},
    {"id": 2, "ticket_type": "Free Registration"},
    {"id": 3, "ticket_type": "Premium Ticket x1"},
    {"id": 4, "ticket_type": "VIP Ticket x1"},
    {"id": 5, "ticket_type": "Free Registration"},
    {"id": 6, "ticket_type": "Premium Ticket x1"},
    {"id": 7, "ticket_type": "VIP Ticket x1"},
    {"id": 8, "ticket_type": "Free Registration"},
    {"id": 9, "ticket_type": "Premium Ticket x1"},
    {"id": 10, "ticket_type": "VIP Ticket x1"},
    {"id": 11, "ticket_type": "Free Registration"},
    {"id": 12, "ticket_type": "Premium Ticket x1"},
    {"id": 13, "ticket_type": "VIP Ticket x1"},
    {"id": 14, "ticket_type": "Free Registration"},
    {"id": 15, "ticket_type": "Premium Ticket x1"},
    {"id": 16, "ticket_type": "VIP Ticket x1"},
    {"id": 17, "ticket_type": "Free Registration"},
    {"id": 18, "ticket_type": "Premium Ticket x1"},
    {"id": 19, "ticket_type": "VIP Ticket x1"},
    {"id": 20, "ticket_type": "Free Registration"},
  ];

  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredList = selectedFilter == 'All'
        ? ticketList
        : ticketList
              .where(
                (item) => item['ticket_type'].toString().toLowerCase().contains(
                  selectedFilter.toLowerCase(),
                ),
              )
              .toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedFilter,
              underline: const SizedBox.shrink(),
              borderRadius: BorderRadius.circular(12),
              dropdownColor: Colors.black87,
              items: const [
                DropdownMenuItem(value: 'All', child: Text('All Tickets')),
                DropdownMenuItem(
                  value: 'Free Registration',
                  child: Text('Free Registration'),
                ),
                DropdownMenuItem(
                  value: 'VIP Ticket',
                  child: Text('VIP Ticket'),
                ),
                DropdownMenuItem(
                  value: 'Premium Ticket',
                  child: Text('Premium Ticket'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedFilter = value;
                  });
                }
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == filteredList.length - 1 ? 16 : 16.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const TicketDetailsView());
                    },
                    child: TicketWidget(
                      type: filteredList[index]["ticket_type"],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
