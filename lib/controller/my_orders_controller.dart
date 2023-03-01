import 'package:bucket/model/item_order_details_model.dart';
import 'package:bucket/model/order_status_model.dart';
import 'package:flutter/material.dart';

class MyOrdersController extends ChangeNotifier {
  List<OrderStatusModel> orderStatusData = [
    OrderStatusModel(data: 'All'),
    OrderStatusModel(data: 'Ordered'),
    OrderStatusModel(data: 'Shipped'),
    OrderStatusModel(data: 'Delivered'),
    OrderStatusModel(data: 'Cancelled'),
    OrderStatusModel(data: 'Return'),
  ];
  int currentIndex = 0;

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  ItemDetailsModel itemDetailsModel = ItemDetailsModel(
      orderDate: '25th November',
      orderID: '45345687654',
      customerName: 'Jabir Kk',
      supplier: 'REW GETO KOS',
      item: 'PACK of-5, Stylish women duppatas',
      deliveryDate: 'Delivery by 15 December 2022');
}
