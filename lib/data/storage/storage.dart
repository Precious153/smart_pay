import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const progressKey = 'progress_key';

class ProgressStorage{
  static late final SharedPreferences _prefs;

  static Future<void> init()async{
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> store(bool progressed)async{
    await _prefs.setBool(progressKey, progressed);
  }

  static bool retrieve() => _prefs.getBool(progressKey) ?? false;

  static clear ()=> _prefs.clear();
}