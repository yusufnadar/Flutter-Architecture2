import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  const CustomInput({Key? key, this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder()
      ),
    );
  }
}
