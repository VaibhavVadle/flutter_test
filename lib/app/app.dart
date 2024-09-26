import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:test_app/core/app_theme.dart';
import 'package:test_app/core/constants/constants.dart';
import 'package:test_app/core/routes/route_generator.dart';
import 'package:test_app/core/routes/routes.dart';

import '../core/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),

      child: MaterialApp(
        title: kAppName,
        navigatorKey: kNavigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: AppTheme.selectedThemeData,
        builder: (context, child) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Utils.hideKeyboardInApp(context);
                },
                child: ScrollConfiguration(
                  behavior: const CustomScrollConfiguration(),
                  child: child ?? Container(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomScrollConfiguration extends ScrollBehavior {
  const CustomScrollConfiguration();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return const BouncingScrollPhysics();
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
