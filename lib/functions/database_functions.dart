// ignore_for_file: unused_local_variable

import 'package:bucket/model/sign_up_model.dart';
import 'package:hive/hive.dart';

class DataBaseFunctions {
  Future<void> addUserData(SignUpModel model) async {
    final dbData = await Hive.openBox<SignUpModel>('dbKey');
    final id = await dbData.add(model);
  }

  Future<List<SignUpModel>> getUserRegistrationData() async {
    final dbData = await Hive.openBox<SignUpModel>('dbKey');
    List<SignUpModel> usermodelList = [];
    usermodelList.clear();
    usermodelList.addAll(dbData.values);
    return usermodelList;
  }

  Future<void> edit(SignUpModel model, int index) async {
    final dbData = await Hive.openBox<SignUpModel>('dbKey');
    await dbData.putAt(index, model);
  }
}
