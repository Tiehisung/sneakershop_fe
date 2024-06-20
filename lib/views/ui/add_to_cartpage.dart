import 'package:flutter/material.dart';
import '/views/shared/appstyle.dart';

class AddToCartPage extends StatefulWidget {
  const AddToCartPage({super.key});

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "AddToCartPage",
        style: appstyle(40, FontWeight.bold, Colors.black),
      ),
    ));
  }
}
