import 'package:bucket/controller/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarController =
        Provider.of<BottomNavigtionBarController>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavigtionBarController>(
        builder: (context, value, child) => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black,
            selectedItemColor: const Color.fromARGB(255, 138, 20, 12),
            onTap: (value) {
              bottomNavigationBarController.onItemTapped(value);
            },
            currentIndex: value.selectedIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: 'My Orders'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account'),
            ]),
      ),
      body: Consumer<BottomNavigtionBarController>(
        builder: (context, value, child) => value.pages[value.selectedIndex],
      ),
    );
  }
}
