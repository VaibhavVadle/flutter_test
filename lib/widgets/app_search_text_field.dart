import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyle.primaryF14W400,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.secondaryBgColor,
        hintText: AppString.search,
        hintStyle:
            AppTextStyle.primaryF14W400.copyWith(color: AppTheme.hintTextColor),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 34.w,
          minHeight: 34.w,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 8.w,
            right: 4.w,
          ),
          child: SvgPicture.asset(
            AppAsset.search,
            height: 24.w,
            width: 24.w,
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
          ),
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 12.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
