import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/view/booking_view/booking_view.dart';
import 'package:makachi_connect/view/explore_view/explore_view.dart';
import 'package:makachi_connect/view/home_view/home_view.dart';
import 'package:makachi_connect/view/profile_view/profile_view.dart';
import 'package:makachi_connect/view/ticket_view/ticket_view.dart';
import 'package:makachi_connect/view/vendor_view/v_earning_view/v_earning_view.dart';
import 'package:makachi_connect/view/vendor_view/v_listing_view/v_listing_view.dart';

import '../vendor_view/v_home_view/v_home_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  // List of screens for each bottom navigation item
  final List<Widget> _screens = [
    VHomeView(),
    // const HomeView(),
    const ExploreView(),
    // const BookingView(),
    VListingView(),
    // const TicketView(),
    VEarningView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomBarFloating(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Explore'),
          TabItem(icon: Icons.calendar_today_outlined, title: 'Booking'),
          TabItem(icon: Icons.airplane_ticket_outlined, title: 'Ticket'),
          TabItem(icon: Icons.person_2_outlined, title: 'Profile'),
        ],
        backgroundColor: AppColors.cardColor,
        color: AppColors.secondaryColor,
        colorSelected: AppColors.primaryColor,
        indexSelected: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
      ),
    );
  }
}
