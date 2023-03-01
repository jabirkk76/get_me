// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:bucket/controller/sign_in_screen_controller.dart';
import 'package:bucket/controller/sign_up_controller.dart';
import 'package:bucket/model/sign_up_model.dart';
import 'package:bucket/utils/preference_manager.dart';

import 'package:bucket/widget/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final signInController =
        Provider.of<SignInController>(context, listen: false);
    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    return CustomElevatedButtonWidget(
      onTap: () async {
        final signInModel = SignUpModel(
            fullName: signInController.fullNameController.text,
            emailId: signInController.emailController.text,
            password: signInController.passwordController.text);
        if (formKey.currentState!.validate()) {
          print(signInModel);

          for (int i = 0; i < signUpController.usersList.length; i++) {
            final preference = await SharedPreferences.getInstance();
            await preference.setBool(myKey, true);
            if (signInController.emailController.text ==
                    signUpController.usersList[i].emailId &&
                signInController.passwordController.text ==
                    signUpController.usersList[i].password) {
              signInController.navigateBottomNavigationBarWidget(context);
            }
          }
        }
      },
      purpose: 'Login',
      height: 40,
      width: 330,
    );
  }
}
