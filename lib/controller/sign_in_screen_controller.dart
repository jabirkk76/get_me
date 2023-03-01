import 'package:bucket/functions/database_functions.dart';
import 'package:bucket/model/sign_up_model.dart';
import 'package:bucket/view/home/widget/bottom_navigation_widget.dart';
import 'package:bucket/view/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  SignInController() {
    getUserData();
  }

  bool isLoading = false;
  List<SignUpModel> usersList = [];

  void getUserData() async {
    isLoading = true;
    notifyListeners();

    usersList = await DataBaseFunctions().getUserRegistrationData();
    isLoading = false;
    notifyListeners();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  void navigateSignUpScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  void navigateBottomNavigationBarWidget(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BottomNavigationBarWidget(),
      ),
    );
  }

  void edit(SignUpModel model, int index) async {
    DataBaseFunctions().edit(model, index);
    notifyListeners();
  }
}
