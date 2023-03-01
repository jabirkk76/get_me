import 'package:bucket/controller/my_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 330,
      child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 60,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Consumer<MyOrdersController>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    value.changeIndex(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: value.currentIndex == index
                          ? const Color.fromARGB(255, 221, 202, 224)
                          : const Color.fromARGB(255, 236, 235, 235),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(55),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        value.orderStatusData[index].data,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
