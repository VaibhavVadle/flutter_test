import 'package:flutter/cupertino.dart';
import 'package:test_app/core/routes/routes.dart';
import 'package:test_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:test_app/screens/home_screen/home_screen.dart';
import 'package:test_app/screens/order_screen/order_screen.dart';
import 'package:test_app/screens/profile_screen/profile_screen.dart';
import 'package:test_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:test_app/screens/sign_up_screen/sign_up_screen.dart';
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
      case Routes.signInScreen:
        return CupertinoPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case Routes.signUpScreen:
        return CupertinoPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.dashBoardScreen:
        return CupertinoPageRoute(
          builder: (_) => const DashBoardScreen(),
        );
      case Routes.homeScreen:
        return CupertinoPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.orderScreen:
        return CupertinoPageRoute(
          builder: (_) => const OrderScreen(),
        );
      case Routes.profileScreen:
        return CupertinoPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => DefaultRouteWidget(screenName: settings.name ?? ""),
        );
    }
  }
}
