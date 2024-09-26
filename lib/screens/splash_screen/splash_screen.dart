import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initialRoute();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.defaultPrimary,
      statusBarIconBrightness:
      Platform.isAndroid ? Brightness.light : Brightness.dark,
      systemNavigationBarIconBrightness:
      Platform.isAndroid ? Brightness.light : Brightness.dark,
    ));
  }

  Future<void> _initialRoute() async {
    String route = Routes.dashBoardScreen;
    await Future.delayed(const Duration(milliseconds: 2500));
    if (mounted) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Center(
        child: Image.asset(
          AppAsset.appLogo,
          height: 130.h,
          width: 130.w,
        ),
      ),
    );
  }
}
