import 'package:bucket/view/my_orders_screen/widget/order_item_detail_widget.dart';
import 'package:bucket/view/my_orders_screen/widget/order_status_widget.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 255, top: 10),
              child: Text(
                'Your Orders',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                height: 40,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      errorBorder: InputBorder.none,
                      hintText: 'Search by Customer, Product, or Order ID',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 183, 182, 182),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const OrderStatusWidget(),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const orderItemDetailWidget();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
