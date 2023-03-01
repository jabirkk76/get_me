import 'package:bucket/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget(
      {super.key,
      required this.height,
      required this.purpose,
      required this.width,
      required this.onTap});
  final double height;
  final double width;
  final String purpose;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(22),
              ),
            ),
            backgroundColor: AppColors.elevatedButtonBgColor),
        onPressed: onTap,
        child: Text(
          purpose,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
