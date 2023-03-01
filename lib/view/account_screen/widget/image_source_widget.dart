import 'package:flutter/material.dart';

class ImageSourceWidget extends StatelessWidget {
  const ImageSourceWidget(
      {super.key,
      required this.iconImage,
      required this.source,
      required this.onTap});
  final String iconImage;
  final String source;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(iconImage), fit: BoxFit.fill)),
            ),
            Text(
              source,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
