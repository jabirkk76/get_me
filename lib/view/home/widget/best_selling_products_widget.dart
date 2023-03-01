import 'package:bucket/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BestSellingProductsWidget extends StatelessWidget {
  const BestSellingProductsWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    return SizedBox(
      height: 186,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: homeController.bestSellingProductsList
            .map(
              (e) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 120,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(e.image), fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Text(e.category),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
