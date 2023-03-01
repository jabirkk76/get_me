import 'package:bucket/controller/sign_up_controller.dart';
import 'package:bucket/model/sign_up_model.dart';
import 'package:bucket/view/my_orders_screen/widget/custom_textformfield_widget.dart';
import 'package:bucket/view/sign_up_screen/widget/dialog_box_widget.dart';
import 'package:bucket/widget/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFieldWidget(
                    hint: 'Full Name',
                    prefixIcon: const Icon(Icons.person),
                    controllerName: signUpController.nameController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter valid name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFieldWidget(
                    hint: 'Email ID',
                    prefixIcon: const Icon(Icons.mail),
                    controllerName: signUpController.emailController,
                    validation: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return 'Enter valid Email ID';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFieldWidget(
                    hint: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    controllerName: signUpController.passwordController,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Enter valid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButtonWidget(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          signUpController.addUser(
                            SignUpModel(
                              fullName: signUpController.nameController.text,
                              emailId: signUpController.emailController.text,
                              password:
                                  signUpController.passwordController.text,
                            ),
                          );
                          await showDialog(
                            context: context,
                            builder: (context) => const DialogBoxWidget(),
                          );
                        }
                      },
                      height: 40,
                      purpose: 'SIGN UP',
                      width: 330),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Already have a account ?'),
                      TextButton(
                        onPressed: () {
                          signUpController.navigateSignInScreen(context);
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
