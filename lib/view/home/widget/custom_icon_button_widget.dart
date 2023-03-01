import 'package:flutter/material.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.color});
  final Icon icon;
  final void Function()? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: icon, color: color);
  }
}
