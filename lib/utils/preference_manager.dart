// ignore_for_file: unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';

const myKey = 'USER LOGGED OR NOT';

class PreferenceManager {
  Future<void> saveData({required bool value}) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(myKey, value);
  }

  Future<bool> getData() async {
    final preferences = await SharedPreferences.getInstance();
    final storedData = preferences.getBool(myKey);
    if (storedData == null) {
      return false;
    } else {
      return true;
    }
  }
}
