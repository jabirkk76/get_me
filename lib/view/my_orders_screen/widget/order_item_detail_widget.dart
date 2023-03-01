// ignore_for_file: camel_case_types

import 'package:bucket/controller/home_controller.dart';
import 'package:bucket/controller/my_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class orderItemDetailWidget extends StatelessWidget {
  const orderItemDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    final myOrdersController =
        Provider.of<MyOrdersController>(context, listen: false);
    final orderItemDetails = myOrdersController.itemDetailsModel;
    return Column(
      children: [
        Text(
          orderItemDetails.orderDate,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              orderItemDetails.orderID,
              style: const TextStyle(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 100),
              child: Text('Sold to '),
            ),
            Text(
              orderItemDetails.customerName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Supplier :',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              orderItemDetails.supplier,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Card(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(homeController.homeCategoryList[2].image),
                ),
              ),
              height: 80,
              width: 50,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(orderItemDetails.item),
                const Divider(
                  thickness: 6,
                  color: Color.fromARGB(255, 236, 234, 234),
                ),
              ],
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.radio_button_checked,
                size: 10,
                color: Colors.green,
              ),
              Text(
                orderItemDetails.deliveryDate,
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
