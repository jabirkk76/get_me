import 'package:bucket/controller/account_screen_controller.dart';
import 'package:bucket/view/account_screen/widget/user_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountScreenController =
        Provider.of<AccountScreenController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 0,
          elevation: 1,
          title: const Text(
            'ACCOUNT',
            style:
                TextStyle(fontSize: 14, color: Color.fromARGB(255, 14, 13, 13)),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ]),
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      accountScreenController.accountModelList[index].icon,
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(accountScreenController
                              .accountModelList[index].category),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'version: 13.8.1(430)',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
