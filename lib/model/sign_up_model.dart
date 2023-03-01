import 'package:hive/hive.dart';
part 'sign_up_model.g.dart';

@HiveType(typeId: 1)
class SignUpModel {
  @HiveField(0)
  final String? fullName;
  @HiveField(1)
  final String? emailId;
  @HiveField(2)
  final String? password;
  @HiveField(3)
  String? image;
  SignUpModel({
    this.fullName,
    this.emailId,
    this.password,
    this.image,
  });
}
