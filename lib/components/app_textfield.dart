import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.label,
      required this.controller,
      this.fillColors,
      this.focusNode,
      this.onchanged});
  String hintText;
  String label;
  bool obscureText = false;
  Color? fillColors;
  TextEditingController controller;
  FocusNode? focusNode;
  void Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        focusNode: focusNode,
        onChanged: onchanged,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.inversePrimary),
            labelStyle: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.inversePrimary),
            label: Text(label),
            filled: true,
            fillColor: fillColors != null
                ? fillColors
                : Theme.of(context).colorScheme.tertiary,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).colorScheme.inversePrimary),
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
