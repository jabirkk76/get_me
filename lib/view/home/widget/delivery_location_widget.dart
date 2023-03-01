import 'package:flutter/material.dart';

class DeliveryLocationWidget extends StatelessWidget {
  const DeliveryLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: const Color.fromARGB(255, 223, 195, 228),
      child: Row(
        children: const [
          Icon(Icons.location_on),
          Text(
            'Delivering to',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Mananthavady - 670645',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
