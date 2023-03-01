// ignore_for_file: use_build_context_synchronously

import 'package:bucket/utils/preference_manager.dart';
import 'package:bucket/view/home/widget/bottom_navigation_widget.dart';
import 'package:bucket/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController with ChangeNotifier {
  void checkUserLoggedIn(context) async {
    final preference = await SharedPreferences.getInstance();
    final userLoggedIn = preference.getBool(myKey);
    if (userLoggedIn == null || userLoggedIn == false) {
      navigateLoginScreen(context);
    } else {
      navigateBottomNavigationWidget(context);
      notifyListeners();
    }
  }

  void navigateLoginScreen(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  void navigateBottomNavigationWidget(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const BottomNavigationBarWidget(),
      ),
    );
  }
}
