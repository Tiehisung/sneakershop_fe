import 'package:flutter/material.dart';
import 'package:sneakershop_fe/models/sneaker_model.dart';
import 'package:sneakershop_fe/services/helpler.dart';
import 'package:sneakershop_fe/views/shared/appstyle.dart';
import 'package:sneakershop_fe/views/shared/product_card.dart';

import '../../constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Future<List<Sneaker>> _maleSneakers;
  late Future<List<Sneaker>> _femaleSneakers;
  late Future<List<Sneaker>> _kidSneakers;

  //get
  void getMale() {
    _maleSneakers = Helper().getMaleSneakers();
  }

  void getFemale() {
    _femaleSneakers = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kidSneakers = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: primBg,
        body: SizedBox(
          height: screenHeight,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: screenHeight * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/blue-bg1.png"),
                      fit: BoxFit.fill),
                  color: Colors.black54,
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, bottom: 15),
                  width: screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Athletics Shoes",
                        style: appstyleWithHt(
                            42, FontWeight.bold, Colors.white, 1.5),
                      ),
                      Text(
                        "Collection",
                        style: appstyleWithHt(
                            42, FontWeight.bold, Colors.white, 1.2),
                      ),
                      //Tabbar
                      TabBar(
                          padding: const EdgeInsets.all(0),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              appstyle(24, FontWeight.bold, Colors.white),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          tabs: const [
                            Tab(
                              text: "Men Shoes",
                            ),
                            Tab(
                              text: "Women Shoes",
                            ),
                            Tab(
                              text: "Kids Shoes",
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.265),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    Column(
                      children: [
                        SizedBox(
                            height: screenHeight * .405,
                            child: FutureBuilder(
                                future: _maleSneakers,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text("Error: ${snapshot.error}");
                                  } else {
                                    final males = snapshot.data;
                                    return ListView.builder(
                                        itemCount: males!.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          final shoe = snapshot.data![index];
                                          return  ProductCard(
                                              price: shoe.price,
                                              category: shoe.category,
                                              id: shoe.id,
                                              name: shoe.name,
                                              image:
                                                  "assets/shoes/colorful.jpeg");
                                        });
                                  }
                                })),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 20, 12, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Latest Shoes",
                                      style: appstyle(
                                          24, FontWeight.bold, Colors.black)),
                                  Row(
                                    children: [
                                      Text("Show All",
                                          style: appstyle(22, FontWeight.normal,
                                              Colors.black)),
                                      const Icon(
                                        Icons.arrow_right,
                                        size: 40,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.13,
                              child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  spreadRadius: 1,
                                                  blurRadius: 0.8,
                                                  offset: Offset(0, 1))
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        height: screenHeight * .12,
                                        width: screenWidth * .28,
                                        child: Image.asset(
                                            'assets/shoes/yellow-black.jpeg'),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: screenHeight * .405,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: screenHeight * .405,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
