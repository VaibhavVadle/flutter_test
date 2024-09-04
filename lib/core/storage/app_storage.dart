import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/models/user_model.dart';

part 'storage_key.dart';

class AppStorage {
  static final AppStorage _instance = AppStorage._internal();

  factory AppStorage() {
    return _instance;
  }

  AppStorage._internal();

  static late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUser(UserModel user) async {
    await _prefs.setString(_user, jsonEncode(user.toJson()));
  }

  static UserModel? get getUser {
    String? userData = _prefs.getString(_user);
    UserModel? user;
    if(userData != null) {
      user = UserModel.fromJson(jsonDecode(userData));
    }
    return user;
  }

  static Future<void> clear() async {
    await _prefs.clear();
  }
}
