import 'package:flutter/cupertino.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:test_app/screens/mobile_recharge_screen/mobile_recharge_screen.dart';
import 'package:test_app/screens/splash_screen/splash_screen.dart';
import 'package:test_app/widgets/default_route_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var argument = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.dashBoardScreen:
        return CupertinoPageRoute(
          builder: (_) => const DashBoardScreen(),
        );
      case Routes.mobileRechargeScreen:
        return CupertinoPageRoute(
          builder: (_) => const MobileRechargeScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => DefaultRouteWidget(screenName: settings.name ?? ""),
        );
    }
  }
}
