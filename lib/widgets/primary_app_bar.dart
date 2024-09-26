import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';

class PrimaryAppBar extends StatelessWidget {
  const PrimaryAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  final bool showBackButton;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.defaultPrimary,
      child: Row(
        children: [
          showBackButton ? _buildBackButton(context) : 44.horizontalSpace,
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.secondaryF24W600,
            ),
          ),
          44.horizontalSpace,
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 0, 24.h),
        child: SvgPicture.asset(
          AppAsset.backArrow,
          width: 20.w,
        ),
      ),
    );
  }
}
