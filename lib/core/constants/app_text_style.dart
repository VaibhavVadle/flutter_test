part of 'constants.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle get title1 => TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: AppTheme.primaryTextColor,
      );

  static TextStyle get title2 => TextStyle(
        fontSize: 20.sp,
        letterSpacing: 0.35,
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
      );

  static TextStyle get title3 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
      );

  static TextStyle get title3Options => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppTheme.grey700,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get headline => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppTheme.primaryTextColor,
      );

  static TextStyle get body => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppTheme.primaryTextColor,
      );

}
