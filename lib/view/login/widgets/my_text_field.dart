import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obsequreText;
  final String hintText;
  final int maxLine;
  final Color color;

  const MyTextField(
      {super.key,
      this.maxLine = 1,
      this.color = Colors.black,
      required this.controller,
      required this.hintText,
      required this.obsequreText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsequreText,
      style: TextStyle(color: color),
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
