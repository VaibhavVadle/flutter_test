import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/app/app.dart';
import 'package:test_app/core/storage/app_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage().init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
    systemNavigationBarIconBrightness:
        Platform.isAndroid ? Brightness.dark : Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const App()));

}
