import 'package:bucket/helpers/app_colors.dart';
import 'package:bucket/view/home/widget/custom_icon_button_widget.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: AppColors.appBarIconColor,
          ),
        ),
        height: 40,
        width: 350,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.search),
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Search by Keyword or Product ID',
                    border: InputBorder.none),
              ),
            ),
            const VerticalDivider(
              width: 2,
              color: Colors.black,
            ),
            CustomIconButtonWidget(
              color: const Color.fromARGB(255, 131, 130, 130),
              icon: const Icon(Icons.mic),
              onTap: () {},
            ),
            CustomIconButtonWidget(
              color: const Color.fromARGB(255, 131, 130, 130),
              icon: const Icon(
                Icons.camera_alt_outlined,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
