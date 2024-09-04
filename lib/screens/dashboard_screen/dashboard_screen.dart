import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/screens/home_screen/home_screen.dart';
import 'package:test_app/screens/order_screen/order_screen.dart';
import 'package:test_app/screens/profile_screen/profile_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const HomeScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentSelectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.highlightColor,
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildNavItem(
            icon: AppAsset.home,
            activeIcon: AppAsset.homeFill,
            label: "Home",
          ),
          _buildNavItem(
            icon: AppAsset.cart,
            activeIcon: AppAsset.cartFill,
            label: "Order",
          ),
          _buildNavItem(
            icon: AppAsset.profile,
            activeIcon: AppAsset.profileFill,
            label: "Profile",
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String label,
    required String icon,
    required String activeIcon,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        height: 32.w,
        width: 32.w,
        colorFilter: ColorFilter.mode(
          AppTheme.grey700,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        activeIcon,
        height: 32.w,
        width: 32.w,
        colorFilter: const ColorFilter.mode(
          AppTheme.darkTeal,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
