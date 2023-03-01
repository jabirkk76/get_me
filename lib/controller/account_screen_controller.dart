// ignore_for_file: body_might_complete_normally_nullable

import 'dart:io';

import 'package:bucket/functions/database_functions.dart';
import 'package:bucket/model/account_screen_model.dart';
import 'package:bucket/model/sign_up_model.dart';
import 'package:bucket/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountScreenController with ChangeNotifier {
  AccountScreenController() {
    getUserData();
  }
  bool isLoading = false;
  List<SignUpModel> usersList = [];

  File? image;
  List<AccountScreenModel> accountModelList = [
    AccountScreenModel(icon: const Icon(Icons.help), category: 'Help Centre'),
    AccountScreenModel(
        icon: const Icon(Icons.language), category: 'Change language'),
    AccountScreenModel(
        icon: const Icon(Icons.money_sharp), category: 'My Bank & UPI Details'),
    AccountScreenModel(icon: const Icon(Icons.settings), category: 'Settings'),
  ];

  Future<File?> pickImage(ImageSource source) async {
    image = await AppUtils().pickImage(source);
    notifyListeners();
  }

  void navigatePreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }

  void getUserData() async {
    isLoading = true;
    notifyListeners();

    usersList = await DataBaseFunctions().getUserRegistrationData();
    isLoading = false;
    notifyListeners();
  }
}
