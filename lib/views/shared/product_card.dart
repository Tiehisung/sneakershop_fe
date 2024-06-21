// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sneakershop_fe/models/sneaker_model.dart';
import 'package:sneakershop_fe/views/shared/appstyle.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.shoe,
  });
  final Sneaker shoe;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final shoe = widget.shoe;
    bool selected = true;
    // print('debugging url:${shoe.images[0]}');
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1))
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    margin: const EdgeInsets.only(left: 6),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(shoe.images[0]),
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) {
                        // handle the error here, e.g., show a placeholder image
                        print('Image load error: $error');
                        print('ImageLink: ${shoe.images[0]}');
                      },
                    )),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.favorite_outline)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: appstyleWithHt(
                          36, FontWeight.bold, Colors.black, 1.1),
                    ),
                    Text(
                      shoe.category,
                      style: appstyleWithHt(
                          18, FontWeight.bold, Colors.black, 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${shoe.price}",
                      style: appstyle(
                        30,
                        FontWeight.w600,
                        Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Colors",
                          style: appstyle(
                            18,
                            FontWeight.w500,
                            Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          label: const Text(""),
                          selected: selected,
                          selectedColor: Colors.black,
                          visualDensity: VisualDensity.compact,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
