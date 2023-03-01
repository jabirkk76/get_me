import 'package:bucket/view/account_screen/account_screen.dart';
import 'package:bucket/view/home/home_screen.dart';
import 'package:bucket/view/my_orders_screen/my_orders_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigtionBarController with ChangeNotifier {
  int selectedIndex = 0;
  onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  final pages = [
    const HomeScreen(
      index: 0,
    ),
    const MyOrdersScreen(),
    const AccountScreen()
  ];
}
