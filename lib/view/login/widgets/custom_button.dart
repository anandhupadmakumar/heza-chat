import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? ontap;
  final String btnText;
  const CustomButton({super.key, required this.btnText, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            btnText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
