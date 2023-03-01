import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget(
      {super.key,
      required this.hint,
      required this.prefixIcon,
      required this.controllerName,
      required this.validation});
  final String hint;
  final Icon prefixIcon;
  final TextEditingController? controllerName;
  final String? Function(String?)? validation;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 60,
        width: 330,
        child: Center(
          child: TextFormField(
            validator: validation,
            controller: controllerName,
            decoration: InputDecoration(
                prefixIcon: prefixIcon,
                hintText: hint,
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
