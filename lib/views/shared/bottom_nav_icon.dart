import 'package:flutter/material.dart';

class BottomNavIconWdg extends StatelessWidget {
  const BottomNavIconWdg({
    super.key,
    this.onTap,
    this.iconData,
  });
  final void Function()? onTap;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
