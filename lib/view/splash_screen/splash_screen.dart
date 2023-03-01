// ignore_for_file: use_build_context_synchronously, unused_element

import 'package:bucket/controller/splash_controller.dart';
import 'package:bucket/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final splashController =
        Provider.of<SplashController>(context, listen: false);

    Future.delayed(
      const Duration(seconds: 3),
      () {
        splashController.checkUserLoggedIn(context);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Container(
          height: 180,
          width: 330,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTegyy5XE6ni31ss2iPPfS6Ky-Bhq8eZZT4Sv4NjT0NLfr8zvCSL-DTYQ81agjezJvhvTQ&usqp=CAU'),
            ),
          ),
        ),
      ),
    );
  }
}
