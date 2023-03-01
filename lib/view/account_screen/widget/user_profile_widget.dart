import 'dart:io';

import 'package:bucket/controller/account_screen_controller.dart';

import 'package:bucket/view/account_screen/widget/image_source_widget.dart';
import 'package:bucket/view/home/widget/custom_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final accountScreenController =
        Provider.of<AccountScreenController>(context, listen: false);
    return Column(
      children: [
        ListTile(
          title: const Text('User name'),
          subtitle: const Text('Beginner'),
          leading: Stack(
            children: [
              Consumer<AccountScreenController>(
                builder: (context, value, child) {
                  if (value.image == null) {
                    return const CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Color.fromARGB(255, 239, 236, 236),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 50,
                      ),
                    );
                  } else {
                    return CircleAvatar(
                      backgroundImage: FileImage(
                        File(value.image!.path),
                      ),
                      maxRadius: 30,
                      backgroundColor: const Color.fromARGB(255, 239, 236, 236),
                    );
                  }
                },
              ),
              Positioned(
                right: -12,
                bottom: -10,
                child: Consumer<AccountScreenController>(
                  builder: (context, value, child) {
                    return CustomIconButtonWidget(
                      color: Colors.black,
                      icon: const Icon(Icons.camera_alt_outlined),
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 150,
                              width: 300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ImageSourceWidget(
                                      onTap: () async {
                                        accountScreenController
                                            .navigatePreviousScreen(context);
                                        await value
                                            .pickImage(ImageSource.camera);

                                        accountScreenController.getUserData();
                                      },
                                      iconImage:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyLJpmYb_7DKxTTbqyS2v1Suv8QrfDwvF4Vg&usqp=CAU',
                                      source: 'Camera'),
                                  ImageSourceWidget(
                                      onTap: () async {
                                        accountScreenController
                                            .navigatePreviousScreen(context);
                                        await value
                                            .pickImage(ImageSource.gallery);
                                      },
                                      iconImage:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdh-231pU2HwfbW8NQskwzvN4R7q-_tj6etg&usqp=CAU',
                                      source: 'Gallery')
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
