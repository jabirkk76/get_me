import 'package:bucket/functions/database_functions.dart';
import 'package:bucket/model/sign_up_model.dart';
import 'package:bucket/view/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SignUpController with ChangeNotifier {
  SignUpController() {
    getUserData();
  }
  bool isLoading = false;
  List<SignUpModel> usersList = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void navigateSignInScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  void addUser(SignUpModel model) {
    DataBaseFunctions().addUserData(model);
    getUserData();
  }

  void getUserData() async {
    isLoading = true;
    notifyListeners();

    usersList = await DataBaseFunctions().getUserRegistrationData();
    isLoading = false;
    notifyListeners();
  }
}
