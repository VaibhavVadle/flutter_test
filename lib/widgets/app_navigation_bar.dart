import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';

// ignore: must_be_immutable
class AppBottomNavigationBar extends StatefulWidget {
  final bool reverse;
  final Curve curve;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? inactiveStripColor;
  final Color? indicatorColor;
  final bool enableShadow;
  int currentIndex;
  final ValueChanged<int> onTap;
  final List<AppNavigationBarItem> items;
  final double? indicatorHeight;
  final double? height;

  AppBottomNavigationBar({
    super.key,
    this.reverse = false,
    this.curve = Curves.linear,
    required this.onTap,
    required this.items,
    this.activeColor,
    this.inactiveColor,
    this.inactiveStripColor,
    this.indicatorColor,
    this.enableShadow = true,
    this.currentIndex = 0,
    this.height,
    this.indicatorHeight,
  }) : assert(items.length >= 2 && items.length <= 5);

  @override
  State createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  bool get reverse => widget.reverse;

  Curve get curve => widget.curve;

  List<AppNavigationBarItem> get items => widget.items;

  double width = 0;
  Color? activeColor;
  Duration duration = const Duration(milliseconds: 270);

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (items.length - 1))!;
    } else {
      return lerpDouble(1.0, -1.0, index / (items.length - 1))!;
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor ?? AppTheme.defaultPrimary;
    return Container(
      height:
          (widget.height ?? 74.h) + MediaQuery.of(context).viewPadding.bottom,
      width: width,
      decoration: BoxDecoration(
        color: AppTheme.defaultBackgroundColor,
        boxShadow: widget.enableShadow
            ? [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ]
            : null,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: widget.indicatorHeight ?? 3.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: (1.5).h,
            left: 0,
            right: 0,
            child: Divider(
              thickness: 1.w,
              height: 1.h,
              color: AppTheme.dividerColor,
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment:
                  Alignment(_getIndicatorPosition(widget.currentIndex), 0),
              curve: curve,
              duration: duration,
              child: Container(
                width: (width / items.length),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  color: widget.indicatorColor ?? activeColor,
                  height: widget.indicatorHeight ?? 3.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _select(int index) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);
    setState(() {});
  }

  Widget _buildItemWidget(AppNavigationBarItem item, bool isSelected) {
    return Container(
      color: Colors.transparent,
      height: widget.height ?? 74.h,
      width: width / items.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            item.icon,
            height: 24.w,
            width: 24.w,
            colorFilter: ColorFilter.mode(
                isSelected
                    ? AppTheme.primaryIconColor
                    : AppTheme.secondaryIconColor,
                BlendMode.srcIn),
          ),
          5.verticalSpace,
          Text(
            item.title,
            style: AppTextStyle.primaryF14W600.copyWith(
              color: isSelected
                  ? AppTheme.primaryIconColor
                  : AppTheme.secondaryIconColor,
            ),
          ),
        ],
      ),
    );
  }
}

class AppNavigationBarItem {
  final String title;
  final String icon;

  AppNavigationBarItem({
    required this.icon,
    required this.title,
  });
}
