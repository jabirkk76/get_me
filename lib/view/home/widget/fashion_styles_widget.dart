import 'package:bucket/controller/home_controller.dart';
import 'package:flutter/material.dart';

class FashionStylesWidget extends StatelessWidget {
  const FashionStylesWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 186,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeController.fashionStylesList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 130,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          homeController.fashionStylesList[index].image),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(homeController.fashionStylesList[index].category),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
