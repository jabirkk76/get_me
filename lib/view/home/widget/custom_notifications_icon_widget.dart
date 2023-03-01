import 'package:bucket/view/home/widget/custom_icon_button_widget.dart';
import 'package:flutter/material.dart';

class CustomNotificationsIconWidget extends StatelessWidget {
  const CustomNotificationsIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButtonWidget(
      color: const Color.fromARGB(255, 131, 130, 130),
      icon: const Icon(
        Icons.notifications,
      ),
      onTap: () {},
    );
  }
}
