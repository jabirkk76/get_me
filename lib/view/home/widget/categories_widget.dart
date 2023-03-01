import 'package:bucket/controller/home_controller.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          homeController.homeCategoryList[index].image,
                        ),
                        fit: BoxFit.fill)),
              ),
              Text(homeController.homeCategoryList[index].name),
            ],
          ),
        ),
      ),
    );
  }
}
