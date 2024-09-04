import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

class Debug {
  static final Debug _instance = Debug._internal();

  factory Debug() => _instance;

  Debug._internal();

  static bool enabled = false;

  static void log(dynamic message, [StackTrace? stackTrace]) {
    if (enabled) {
      String log = stackTrace != null ? "[Debug] $message \n $stackTrace" : "[Debug] $message";
      debugPrint(log);
    }
  }

  static void d(String message, [String tag = '']) {
    if (enabled) {
      developer.log(message.toString(), name: tag);
    }
  }
}
