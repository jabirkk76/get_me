// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AppUtils {
  Future<File?> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return null;
    } else {
      final _image = File(image.path);
      return _image;
    }
  }
}
