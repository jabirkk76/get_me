// ignore_for_file: iterable_contains_unrelated_type

import 'package:bucket/controller/sign_in_screen_controller.dart';

import 'package:bucket/view/my_orders_screen/widget/custom_textformfield_widget.dart';
import 'package:bucket/view/sign_in_screen/widget/login_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final signInController =
        Provider.of<SignInController>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Please sign in to continue.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 168, 167, 167)),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFieldWidget(
                  hint: 'Email ID',
                  prefixIcon: const Icon(Icons.mail),
                  controllerName: signInController.emailController,
                  validation: (value) {
                    if (value!.isEmpty || !value.contains("@")) {
                      return 'Enter valid Email ID';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFieldWidget(
                  hint: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  controllerName: signInController.passwordController,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginButtonWidget(
                  formKey: formKey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Don' '\'t have an account ?'),
                    TextButton(
                      onPressed: () {
                        signInController.navigateSignUpScreen(context);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
