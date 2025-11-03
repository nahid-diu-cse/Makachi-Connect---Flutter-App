import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/view/profile_view/profile_view.dart';
import 'package:makachi_connect/view_model/controller/role_controller.dart';

import '../booking_view/booking_view.dart';
import '../explore_view/explore_view.dart';
import '../home_view/home_view.dart';
import '../ticket_view/ticket_view.dart';
import '../vendor_view/v_earning_view/v_earning_view.dart';
import '../vendor_view/v_home_view/v_home_view.dart';
import '../vendor_view/v_listing_view/v_listing_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  RoleController roleController = Get.find<RoleController>();

  final List<Widget> _screens = [
    const HomeView(),
    const ExploreView(),
    const BookingView(),
    const TicketView(),
    const ProfileView(),
  ];

  final List<Widget> _vendorScreens = [
    const VHomeView(),
    const VListingView(),
    const BookingView(),
    const VEarningView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: roleController.role == Role.vendor
          ? _vendorScreens[_currentIndex]
          : _screens[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: BottomBarFloating(
          items: roleController.role == Role.user
              ? const [
                  TabItem(icon: Icons.home_filled, title: 'Home'),
                  TabItem(icon: Icons.search, title: 'Explore'),
                  TabItem(icon: Icons.event_available, title: 'Booking'),
                  TabItem(icon: Icons.confirmation_number, title: 'Ticket'),
                  TabItem(icon: Icons.perm_identity, title: 'Profile'),
                ]
              : const [
                  TabItem(icon: Icons.home_filled, title: 'Home'),
                  TabItem(icon: Icons.list_alt, title: 'Listing'),
                  TabItem(icon: Icons.event_available, title: 'Booking'),
                  TabItem(icon: Icons.wallet, title: 'Earning'),
                  TabItem(icon: Icons.perm_identity, title: 'Profile'),
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
      ),
    );
  }
}
