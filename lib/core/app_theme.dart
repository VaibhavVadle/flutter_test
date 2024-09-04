import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  /// Default Colors
  static const Color defaultBackgroundColor = Color(0xffFFFFFF);
  static const Color defaultContainerColor = Color(0xffFBFBFD);
  static const Color defaultPrimary = blue;
  static Color defaultSecondary = Colors.blueAccent;
  static const Color defaultError = Colors.red;

  static const Color lightPrimary = Color(0xffEDF3F4);
  static const Color darkGrey = Color(0xff333333);
  static const Color lightGrey = Color(0xffD9D9D9);
  static Color grey700 = const Color(0xff808080);
  static const Color hintTextColor = Color(0xff616161);
  static const Color black = Color(0xff000000);
  static const Color grey200 = Color(0xffEBF0F4);
  static const Color primaryTextColor = Color(0xff000000);
  static const Color secondaryTextColor = Color(0xffFBFBFD);
  static const Color black700 = Color(0xff1E1E1E);
  static const Color bottomNavColor = Color(0xffEFF0F6);
  static const Color iconHighlightColor = Color(0xffF2F6F9);
  static const Color textFieldBorderColor = Color(0xffF2F6F9);
  static const Color primaryBorderColor = Color(0xffE0DCDC);
  static const Color textFieldColor = Color(0xff989898);
  static const Color dialogBgColor = Color(0xffF2F2F2);
  static const Color secondaryBorderColor = Color(0xff000000);
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color blue = Color(0xff00B9E1);
  static Color highlightColor = blue.withOpacity(0.1);
  static Color disableColor = blue.withOpacity(0.5);
  static const Color cyan = Color(0xff2AD5D8);
  static const Color cyanAccent = Color(0xff00C4C8);
  static const Color darkBlue = Color(0xff007AFF);
  static const Color darkTeal = Color(0xff114552);
  static const Color deepBlue = Color(0xff0F4651);
  static const Color tint = Color(0xff38E7BA);
  static const Color yellow = Color(0xffFBD769);
  static const Color saffronYellow = Color(0xffFBD86A);
  static const Color yellow500 = Color(0xffFCD86A);
  static const Color lightYellow = Color(0xffFABE3C);
  static const Color yellowOrange = Color(0xffF9B023);

  static Color primaryShadowColor = const Color(0xff000000).withOpacity(0.1);
  static Color secondaryShadowColor = const Color(0xff000000).withOpacity(0.25);
  static Color lightShadowColor = const Color(0xff000000).withOpacity(0.15);
  static Color black300 = const Color(0xff000000).withOpacity(0.31);
  static Color switchBgColor = const Color(0xffE6E6E9);
  static Color secondaryContainerColor = const Color(0xffE0E0E0);
  static Color lightBorderColor = grey700.withOpacity(0.48);
  static Color iconColor = const Color(0xff1E1E1E).withOpacity(0.5);
  static Color primaryIconColor = black;
  static Color dividerColor = const Color(0xffE8E5E5).withOpacity(0.8824);
  static Color lightDividerColor = const Color(0xffE0DCDC);
  static Color secondaryDividerColor = const Color(0xffC6C6C8);
  static Color pointBgColor = const Color(0xffEDEDED);

  /// Default app theme color

  static ThemeData selectedThemeData = _themeData(colorScheme(
    primary: defaultPrimary,
    secondary: defaultSecondary,
  ));

  static ThemeData _themeData(ColorScheme colorScheme) {
    return ThemeData(
      platform: TargetPlatform.android,
      useMaterial3: false,
      scaffoldBackgroundColor: colorScheme.surface,
      splashColor: Colors.blue.withOpacity(0.1),
      highlightColor: Colors.blue.withOpacity(0.1),
      dividerColor: dividerColor,
      unselectedWidgetColor: Colors.grey.shade300,
      dividerTheme: DividerThemeData(
        color: dividerColor,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStateProperty.all(Colors.black.withOpacity(0.3)),
        interactive: true,
        thumbVisibility: WidgetStateProperty.all(true),
        trackVisibility: WidgetStateProperty.all(false),
        thickness: WidgetStateProperty.all(6),
        radius: const Radius.circular(30),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: primaryTextColor),
        bodySmall: TextStyle(color: primaryTextColor),
        bodyLarge: TextStyle(color: primaryTextColor),
        headlineMedium: TextStyle(color: primaryTextColor),
        displayLarge: TextStyle(color: primaryTextColor),
        displayMedium: TextStyle(color: primaryTextColor),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionHandleColor: colorScheme.primary,
        selectionColor: colorScheme.primary.withOpacity(0.2),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        iconTheme: IconThemeData(color: colorScheme.primary),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.surface,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0,
        modalElevation: 0,
        backgroundColor: colorScheme.surface,
        modalBackgroundColor: colorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      colorScheme: colorScheme.copyWith(surface: colorScheme.surface),
    );
  }

  static ColorScheme colorScheme({
    required Color primary,
    required Color secondary,
  }) {
    return ColorScheme(
      primary: defaultPrimary,
      onPrimary: defaultPrimary,
      primaryContainer: defaultContainerColor,
      secondary: defaultSecondary,
      onSecondary: defaultSecondary,
      secondaryContainer: defaultContainerColor,
      error: defaultError,
      onError: defaultError,
      surface: defaultBackgroundColor,
      onSurface: defaultBackgroundColor,
      brightness: Brightness.dark,
    );
  }
}
