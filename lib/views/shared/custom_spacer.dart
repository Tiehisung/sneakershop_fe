import 'package:flutter/material.dart';

class CustomSpacerV extends StatelessWidget {
  const CustomSpacerV({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
    );
  }
}

class CustomSpacerH extends StatelessWidget {
  const CustomSpacerH({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 25,
    );
  }
}
