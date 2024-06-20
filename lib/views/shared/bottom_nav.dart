import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop_fe/controllers/mainscreen_provider.dart';

import 'bottom_nav_icon.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainscreenNotifier>(
        builder: (context, mainscreenNotifier, child) {
      final activeIndex = mainscreenNotifier.pageIndex;
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Home
              BottomNavIconWdg(
                onTap: () {
                  mainscreenNotifier.pageIndex = 0;
                },
                iconData: activeIndex == 0 ? Icons.home : Icons.home_outlined,
              ),
              //Search
              BottomNavIconWdg(
                onTap: () {
                  mainscreenNotifier.pageIndex = 1;
                },
                iconData:
                    activeIndex == 1 ? Icons.search : Icons.search_outlined,
              ),
              //Add
              BottomNavIconWdg(
                onTap: () {
                  mainscreenNotifier.pageIndex = 2;
                },
                iconData: activeIndex == 2 ? Icons.add_circle : Icons.add,
              ),
              //Cart
              BottomNavIconWdg(
                onTap: () {
                  mainscreenNotifier.pageIndex = 3;
                },
                iconData: activeIndex == 3
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
              ),
              //Profile
              BottomNavIconWdg(
                onTap: () {
                  mainscreenNotifier.pageIndex = 4;
                },
                iconData:
                    activeIndex == 4 ? Icons.person : Icons.person_2_outlined,
              ),
            ],
          ),
        ),
      ));
    });
  }
}
