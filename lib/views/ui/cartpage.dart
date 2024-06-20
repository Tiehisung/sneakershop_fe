import 'package:flutter/material.dart';
import '/views/shared/appstyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "CartPage",
        style: appstyle(40, FontWeight.bold, Colors.black),
      ),
    ));
  }
}
