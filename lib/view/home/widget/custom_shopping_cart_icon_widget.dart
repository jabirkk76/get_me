import 'package:bucket/view/home/widget/custom_icon_button_widget.dart';
import 'package:flutter/material.dart';

class CustomshoppingCartIconWidget extends StatelessWidget {
  const CustomshoppingCartIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomIconButtonWidget(
      color: const Color.fromARGB(255, 131, 130, 130),
      icon: const Icon(
        Icons.shopping_cart,
      ),
      onTap: () {},
    );
  }
}
