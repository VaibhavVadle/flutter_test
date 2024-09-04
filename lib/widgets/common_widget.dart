import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';

class CommonWidget {
  static Widget backButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 40.w,
          width: 40.w,
          margin: EdgeInsets.only(top: 20.h),
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: AppTheme.highlightColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SvgPicture.asset(AppAsset.backArrow),
        ),
      ),
    );
  }
}
