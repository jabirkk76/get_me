import 'package:bucket/controller/home_controller.dart';
import 'package:flutter/material.dart';

class LowPriceStoreWidget extends StatelessWidget {
  const LowPriceStoreWidget({
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
        itemCount: homeController.lowPriceList.length,
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
                          homeController.lowPriceList[index].image),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(homeController.lowPriceList[index].name),
          ],
        ),
      ),
    );
  }
}
