import 'package:bucket/controller/home_controller.dart';
import 'package:bucket/controller/sign_up_controller.dart';
import 'package:bucket/helpers/app_colors.dart';

import 'package:bucket/view/home/widget/best_selling_products_widget.dart';
import 'package:bucket/view/home/widget/carousel_slider_widget.dart';
import 'package:bucket/view/home/widget/categories_widget.dart';
import 'package:bucket/view/home/widget/custom_favorite_icon_widget.dart';
import 'package:bucket/view/home/widget/custom_notifications_icon_widget.dart';
import 'package:bucket/view/home/widget/custom_shopping_cart_icon_widget.dart';
import 'package:bucket/view/home/widget/delivery_location_widget.dart';
import 'package:bucket/view/home/widget/fashion_styles_widget.dart';
import 'package:bucket/view/home/widget/low_price_store_widget.dart';
import 'package:bucket/view/home/widget/textformfield_widget.dart';
import 'package:bucket/view/home/widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);

    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(backgroundColor: AppColors.circleAvatarColor),
        ),
        title: Text(
          signUpController.nameController.text,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
        actions: const [
          CustomFavoriteIconWidget(),
          CustomNotificationsIconWidget(),
          CustomshoppingCartIconWidget(),
        ],
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1200,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SearchBarWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    const DeliveryLocationWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    CategoriesWidget(homeController: homeController),
                    const CarouselSliderWidget(),
                    const Divider(
                      thickness: 5,
                    ),
                    const TitleWidget(
                      title: 'Bestselling Products',
                    ),
                    BestSellingProductsWidget(
                      homeController: homeController,
                    ),
                    const TitleWidget(
                      title: 'Fashion Styles',
                    ),
                    FashionStylesWidget(homeController: homeController),
                    const TitleWidget(
                      title: 'Low Price Store',
                    ),
                    LowPriceStoreWidget(homeController: homeController),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
