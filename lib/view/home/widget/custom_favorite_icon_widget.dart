import 'package:bucket/controller/home_controller.dart';
import 'package:bucket/view/home/widget/custom_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomFavoriteIconWidget extends StatelessWidget {
  const CustomFavoriteIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) => CustomIconButtonWidget(
        color: const Color.fromARGB(255, 131, 130, 130),
        icon: Icon(
          Icons.favorite,
          color: value.favoriteIconColor,
        ),
        onTap: () {
          value.changeIconColor();
        },
      ),
    );
  }
}
