// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sneakershop_fe/constants/colors.dart';
import 'package:sneakershop_fe/models/sneaker_model.dart';
import 'package:sneakershop_fe/services/helpler.dart';
import 'package:sneakershop_fe/views/shared/appstyle.dart';
import 'package:sneakershop_fe/views/shared/category_btn.dart';
import 'package:sneakershop_fe/views/shared/custom_spacer.dart';
import 'package:sneakershop_fe/views/shared/latest_shoes.dart';

class ProductByCategory extends StatefulWidget {
  const ProductByCategory({
    super.key,
    required this.tabIndex,
  });
  final int tabIndex;
  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory>
    with TickerProviderStateMixin {
  late final _tabController =
      TabController(initialIndex: widget.tabIndex, length: 3, vsync: this);
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

  List<String> brands = [
    "assets/images/adidas-logo.png",
    "assets/images/gucci-logo.png",
    "assets/images/air-jordan-logo.png",
    "assets/images/nike-logo.png",
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primBg,
      body: SizedBox(
        height: screenHeight,
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: screenHeight * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/blue-bg1.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                      // Filter
                      GestureDetector(
                        onTap: () {
                          filter();
                        },
                        child: const Icon(Icons.settings_outlined,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                //Tabbar
                TabBar(
                    padding: const EdgeInsets.all(0),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelStyle: appstyle(24, FontWeight.bold, Colors.white),
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
          Padding(
            padding:
                EdgeInsets.only(top: screenHeight * 0.175, left: 16, right: 12),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: TabBarView(controller: _tabController, children: [
                LatestShoesWgt(categoryShoes: _maleSneakers),
                LatestShoesWgt(categoryShoes: _femaleSneakers),
                LatestShoesWgt(categoryShoes: _kidSneakers),
              ]),
            ),
          )
        ]),
      ),
    );
  }

  Future<dynamic> filter() {
    return showModalBottomSheet(
        isScrollControlled: true,
        barrierColor: Colors.white54,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          var deviceHeight = MediaQuery.of(context).size.height;
          double value = 10;
          return Container(
            height: deviceHeight * .84,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                //Black line
                Container(
                  height: 5,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      const CustomSpacerV(),
                      Text("Filter",
                          style: appstyle(40, FontWeight.bold, Colors.black)),
                      const CustomSpacerV(),
                    ],
                  ),
                ),
                // Gender
                Text("Gender",
                    style: appstyle(20, FontWeight.bold, Colors.black)),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  children: [
                    CategoryBtn(label: "Men", buttonColor: Colors.black),
                    CategoryBtn(label: "Women", buttonColor: Colors.grey),
                    CategoryBtn(label: "Kids", buttonColor: Colors.grey),
                  ],
                ),

                const CustomSpacerV(),
                //Categories
                Text(
                  "Category",
                  style: appstyle(20, FontWeight.w600, Colors.black),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  children: [
                    CategoryBtn(label: "Shoes", buttonColor: Colors.black),
                    CategoryBtn(label: "Apparels", buttonColor: Colors.grey),
                    CategoryBtn(label: "Accessories", buttonColor: Colors.grey),
                  ],
                ),
                const CustomSpacerV(),
                //Categories
                Text(
                  "Price",
                  style: appstyle(20, FontWeight.bold, Colors.black),
                ),
                const CustomSpacerV(),
                Slider(
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    thumbColor: Colors.black,
                    max: 500,
                    divisions: 50,
                    secondaryTrackValue: 200,
                    label: value.toString(),
                    value: value,
                    onChanged: (double value) {}),
                const CustomSpacerV(),
                Text(
                  "Brands",
                  style: appstyle(20, FontWeight.bold, Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                      itemCount: brands.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            child: Image.asset(
                              brands[index],
                              height: 60,
                              width: 80,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        });
  }
}
