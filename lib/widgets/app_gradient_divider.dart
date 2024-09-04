import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/extensions/extensions.dart';

class AppGradientDivider extends StatelessWidget {
  const AppGradientDivider({
    super.key,
    this.thickness,
    this.width,
    this.height,
  });

  final double? thickness;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context).colorScheme;
    return Container(
      width: width ?? double.infinity,
      height: thickness ?? 1.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            themeColor.surface,
            AppTheme.black,
            themeColor.surface,
          ],
        ),
      ),
    ).paddingSymmetric(vertical: height ?? 5.h);
  }
}
