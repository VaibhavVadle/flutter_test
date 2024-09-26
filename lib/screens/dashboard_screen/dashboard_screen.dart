import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/screens/my_account_screen/my_account_screen.dart';
import 'package:test_app/widgets/app_navigation_bar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentSelectedIndex = 1;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    Container(),
    const MyAccountScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentSelectedIndex,
        children: pages,
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentSelectedIndex,
        onTap: (value) {
          setState(() {
            currentSelectedIndex = value;
          });
        },
        items: [
          AppNavigationBarItem(
            icon: AppAsset.home,
            title: AppString.home,
          ),
          AppNavigationBarItem(
            icon: AppAsset.accounts,
            title: AppString.myAccount,
          ),
          AppNavigationBarItem(
            icon: AppAsset.history,
            title: AppString.history,
          ),
          AppNavigationBarItem(
            icon: AppAsset.profile,
            title: AppString.profile,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String label,
    required String icon,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        height: 24.w,
        width: 24.w,
        colorFilter: const ColorFilter.mode(
          AppTheme.secondaryIconColor,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        icon,
        height: 24.w,
        width: 24.w,
        colorFilter: const ColorFilter.mode(
          AppTheme.primaryIconColor,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
