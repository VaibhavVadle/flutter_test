import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/core/storage/app_storage.dart';

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

  Future<void> _initialRoute() async {
    final user = AppStorage.getUser;
    String route = Routes.signInScreen;
    if (user != null) {
      route = Routes.dashBoardScreen;
    }
    await Future.delayed(const Duration(milliseconds: 2500));
    if (mounted) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppAsset.appLogo,
              height: 120.h,
              width: 120.w,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 30.h,
            child: const Center(
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
