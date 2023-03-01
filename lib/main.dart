import 'package:bucket/controller/account_screen_controller.dart';
import 'package:bucket/controller/bottom_navigation_bar_controller.dart';
import 'package:bucket/controller/home_controller.dart';
import 'package:bucket/controller/my_orders_controller.dart';
import 'package:bucket/controller/sign_in_screen_controller.dart';
import 'package:bucket/controller/sign_up_controller.dart';
import 'package:bucket/controller/splash_controller.dart';
import 'package:bucket/model/sign_up_model.dart';

import 'package:bucket/view/splash_screen/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

const saveKeyName = 'UserLoggedIn';
void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(SignUpModelAdapter().typeId)) {
    Hive.registerAdapter(SignUpModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavigtionBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyOrdersController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
