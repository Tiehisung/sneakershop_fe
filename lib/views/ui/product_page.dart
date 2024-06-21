// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop_fe/controllers/product_provider.dart';
import 'package:sneakershop_fe/models/sneaker_model.dart';
import 'package:sneakershop_fe/services/helpler.dart';
import 'package:sneakershop_fe/views/shared/appstyle.dart';

import '../shared/checkout_btn.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.id,
    required this.category,
  });
  final String id;
  final String category;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final pageController = PageController();
  late Future<Sneaker> _sneaker;

  void getShoe() {
    if (widget.category == "men shoe") {
      _sneaker = Helper().getMaleSneakerById(widget.id);
    } else if (widget.category == "women shoe") {
      _sneaker = Helper().getFemaleSneakerById(widget.id);
    } else {
      _sneaker = Helper().getKidSneakerById(widget.id);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getShoe();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: FutureBuilder<Sneaker>(
            future: _sneaker,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                final sneaker = snapshot.data;
                return Consumer<ProductNotifier>(
                  builder: (context, productNotifier, child) {
                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    productNotifier.shoeSizes.clear();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(Icons.close,
                                      color: Colors.black87),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(Icons.more_horiz),
                                ),
                              ],
                            ),
                          ),
                          pinned: true,
                          snap: false,
                          floating: true,
                          backgroundColor: Colors.transparent,
                          expandedHeight: screenHeight,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Stack(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.5,
                                  width: screenWidth,
                                  child: PageView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: sneaker!.images.length,
                                      controller: pageController,
                                      onPageChanged: (pageIndex) {
                                        productNotifier.activePageIndex =
                                            pageIndex;
                                      },
                                      itemBuilder: (context, index) {
                                        return Stack(
                                          children: [
                                            Container(
                                              width: screenWidth,
                                              height: screenHeight * 0.35,
                                              color: Colors.grey.shade300,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Image.network(
                                                  sneaker.images[index],
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: screenHeight * 0.1,
                                                right: 20,
                                                child: const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.grey)),
                                            //Center page  controller buttons
                                            Positioned(
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                height: screenHeight * 0.39,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: List.generate(
                                                      sneaker.images.length,
                                                      (index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 4,
                                                        right: 4,
                                                      ),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor:
                                                            productNotifier
                                                                        .activePageIndex !=
                                                                    index
                                                                ? Colors.grey
                                                                : Colors.black,
                                                      ),
                                                    );
                                                  }),
                                                )),
                                          ],
                                        );
                                      }),
                                ),
                                Positioned(
                                    bottom: 30,
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                        child: Container(
                                          height: screenHeight * 0.645,
                                          width: screenWidth,
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(sneaker.name,
                                                    style: appstyle(
                                                        40,
                                                        FontWeight.bold,
                                                        Colors.black)),
                                                Row(children: [
                                                  Text(sneaker.category,
                                                      style: appstyle(
                                                          20,
                                                          FontWeight.w500,
                                                          Colors.grey)),
                                                  const SizedBox(width: 20),
                                                  RatingBar.builder(
                                                    initialRating: 4,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 22,
                                                    itemPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 1),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(Icons.star,
                                                            size: 18,
                                                            color:
                                                                Colors.black26),
                                                    onRatingUpdate: (rating) {},
                                                  )
                                                ]),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("\$${sneaker.price}",
                                                        style: appstyle(
                                                            26,
                                                            FontWeight.w600,
                                                            Colors.black)),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Colors",
                                                          style: appstyle(
                                                              18,
                                                              FontWeight.w500,
                                                              Colors.black),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const CircleAvatar(
                                                          radius: 7,
                                                          backgroundColor:
                                                              Colors.black,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const CircleAvatar(
                                                          radius: 7,
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Select sizes",
                                                            style: appstyle(
                                                                20,
                                                                FontWeight.w600,
                                                                Colors.black)),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text("View size guide",
                                                            style: appstyle(
                                                                20,
                                                                FontWeight.w600,
                                                                Colors.grey)),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    // Sizes
                                                    SizedBox(
                                                      height: 40,
                                                      child: ListView.builder(
                                                        itemCount:
                                                            productNotifier
                                                                .shoeSizes
                                                                .length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return ChoiceChip(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            60),
                                                                side: const BorderSide(
                                                                    width: 1,
                                                                    style: BorderStyle
                                                                        .solid)),
                                                            label: Text(
                                                              productNotifier
                                                                      .shoeSizes[
                                                                  index]["size"],
                                                              style: appstyle(
                                                                  18,
                                                                  FontWeight
                                                                      .w500,
                                                                  Colors.black),
                                                            ),
                                                            disabledColor:
                                                                Colors.white,
                                                            selected: productNotifier
                                                                        .shoeSizes[
                                                                    index]
                                                                ["isSelected"],
                                                            onSelected:
                                                                (newState) {
                                                              productNotifier
                                                                  .toggleSelection(
                                                                      index);
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Divider(
                                                  indent: 10,
                                                  endIndent: 10,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.8,
                                                  child: Text(sneaker.title,
                                                      style: appstyle(
                                                          26,
                                                          FontWeight.w700,
                                                          Colors.black)),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(sneaker.description,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: appstyle(
                                                        14,
                                                        FontWeight.normal,
                                                        Colors.black)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12),
                                                  //Checkout  Button
                                                    child: CheckoutBtn(
                                                      label: "Add to art",
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              }
            }));
  }
}
