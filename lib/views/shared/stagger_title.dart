// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sneakershop_fe/models/sneaker_model.dart';
import 'package:sneakershop_fe/services/manipulate.dart';
import 'package:sneakershop_fe/views/shared/appstyle.dart';

class StaggerTitleWdgt extends StatefulWidget {
  const StaggerTitleWdgt({
    super.key,
    required this.shoe,
    required this.height,
  });
  final Sneaker shoe;
  final double height;
  @override
  State<StaggerTitleWdgt> createState() => _StaggerTitleWdgtState();
}

class _StaggerTitleWdgtState extends State<StaggerTitleWdgt> {
  @override
  Widget build(BuildContext context) {
    final shoe = widget.shoe;
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Image.network(
                shoe.images[0],
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 70,
              // padding: const EdgeInsets.all(8), //check
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      capitalizeEveryWord(shoe.name.length > 15
                          ? "${shoe.name.substring(0, 12).replaceAll("-", " ")}..."
                          : shoe.name.replaceAll("-", " ")),
                      style:
                          appstyleWithHt(24, FontWeight.bold, Colors.black, 1)),
                  Text("\$${shoe.price}",
                      style:
                          appstyleWithHt(20, FontWeight.w500, Colors.black, 1)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
