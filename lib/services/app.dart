import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService with ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  bool _initialized = false;
  AppService({
    required this.sharedPreferences,
  });

  bool get initialized => _initialized;

  Future<bool> startUpCheck() async {
    _initialized = true;
    notifyListeners();
    return true;
  }
}
