// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sneakershop_fe/views/shared/appstyle.dart';

class CheckoutBtn extends StatelessWidget {
  const CheckoutBtn({
    super.key,
    required this.label,
    this.onTap,
  });
  
  final void Function()? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(17))),
          height: 50,
          width: screenWidth * 0.9,
          child: Center(
            child: Text(
              label,
              style: appstyle(20, FontWeight.bold, Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
