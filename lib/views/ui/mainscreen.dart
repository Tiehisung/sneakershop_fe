import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop_fe/constants/colors.dart';
import 'package:sneakershop_fe/controllers/mainscreen_provider.dart';
import 'package:sneakershop_fe/views/ui/add_to_cartpage.dart';
import 'package:sneakershop_fe/views/ui/cartpage.dart';
import 'package:sneakershop_fe/views/ui/homepage.dart';
import 'package:sneakershop_fe/views/ui/profile.dart';
import 'package:sneakershop_fe/views/ui/searchpage.dart';

import '../shared/bottom_nav.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    AddToCartPage(),
    CartPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainscreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        backgroundColor: primBg,
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: const BottomNavBar(),
      );
    });
  }
}
