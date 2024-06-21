import 'package:flutter/material.dart';
import 'package:sneakershop_fe/views/shared/appstyle.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key,
      this.onPressed,
      required this.label,
      required this.buttonColor});
  final void Function()? onPressed;
  final String label;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: buttonColor, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(9))),
        child: Center(child: Text(label, style: appstyle(20, FontWeight.w600, buttonColor))),
      ),
    );
  }
}
