import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    this.isActive = true,
    required this.label,
    this.isLoading = false,
    this.enabledColor,
    this.loaderColor = AppTheme.white,
    this.elevation,
    this.height,
    this.disabledColor,
    this.txtStyle,
  });

  final void Function()? onPressed;
  final bool isActive;
  final bool isLoading;
  final String label;
  final Color? enabledColor;
  final Color loaderColor;
  final Color? disabledColor;
  final double? elevation;
  final double? height;
  final TextStyle? txtStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 55.h,
      child: TextButton(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all<double?>(elevation),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            ),
            backgroundColor: isActive
                ? WidgetStateProperty.all<Color>(
                    enabledColor ?? AppTheme.defaultPrimary)
                : WidgetStateProperty.all<Color>(
                    disabledColor ?? AppTheme.disableColor),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            splashFactory: NoSplash.splashFactory),
        onPressed: !isLoading && isActive
            ? () {
                FocusScope.of(context).unfocus();
                onPressed?.call();
              }
            : null,
        child: isLoading
            ? FittedBox(
                child: Center(
                  child: CircularProgressIndicator(
                    color: loaderColor,
                  ),
                ),
              )
            : Text(
                label,
                style: txtStyle ??
                    AppTextStyle.headline
                        .copyWith(color: AppTheme.secondaryTextColor)
              ),
      ),
    );
  }
}
