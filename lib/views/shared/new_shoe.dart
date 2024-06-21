import 'package:flutter/material.dart';
import 'package:sneakershop_fe/models/sneaker_model.dart';

class NewShoeWdg extends StatelessWidget {
  const NewShoeWdg({
    super.key,
    required this.shoe,
  });

  final Sneaker shoe;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 0.8,
                offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      height: screenHeight * .12,
      width: screenWidth * .28,
      child: Image.network(
        "https://res.cloudinary.com/dgp4vzn3m/image/authenticated/s--Nn_qdZyF--/v1718642278/players/2024/Alhassan%20_Ibrahim/Sports%20shoe%2028358.png",
      ),
    );
  }
}
