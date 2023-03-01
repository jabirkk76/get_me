import 'package:bucket/controller/sign_up_controller.dart';
import 'package:bucket/helpers/app_colors.dart';
import 'package:bucket/widget/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogBoxWidget extends StatelessWidget {
  const DialogBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    return Dialog(
      child: SizedBox(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Account created successfully',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              backgroundColor: AppColors.ElevatedButton2BgColor,
              child: Icon(
                Icons.check,
                color: AppColors.checkIconColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButtonWidget(
              onTap: () {
                signUpController.navigateSignInScreen(context);
              },
              height: 40,
              width: 100,
              purpose: 'Okay',
            )
          ],
        ),
      ),
    );
  }
}
