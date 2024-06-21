import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop_fe/controllers/product_provider.dart';
import 'package:sneakershop_fe/models/sneaker_model.dart';
import 'package:sneakershop_fe/views/shared/appstyle.dart';
import 'package:sneakershop_fe/views/shared/new_shoe.dart';
import 'package:sneakershop_fe/views/shared/product_card.dart';
import 'package:sneakershop_fe/views/ui/product_by_category.dart';
import 'package:sneakershop_fe/views/ui/product_page.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneaker>> categorySneakers,
    required this.tabIndex,
  }) : _categorySneakers = categorySneakers;
  final int tabIndex;
  final Future<List<Sneaker>> _categorySneakers;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      children: [
        SizedBox(
            height: screenHeight * 0.405,
            child: FutureBuilder(
                future: _categorySneakers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                          //Shoe Product
                          return GestureDetector(
                            onTap: () {
                              //Update  sizes to current shoe sizes
                              productNotifier.shoeSizes = shoe.sizes;
                              // print(productNotifier.shoeSizes);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductPage(
                                          id: shoe.id,
                                          category: shoe.category)));
                            },
                            child: ProductCard(
                              shoe: shoe,
                            ),
                          );
                        });
                  }
                })),
        //Latest  Sneakers
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest Shoes",
                      style: appstyle(24, FontWeight.bold, Colors.black)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCategory(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text("Show All",
                            style:
                                appstyle(22, FontWeight.normal, Colors.black)),
                        const Icon(
                          Icons.arrow_right,
                          size: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: screenHeight * 0.13,
                child: FutureBuilder<List<Sneaker>>(
                    future: _categorySneakers,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else {
                        //Shoes data
                        final shoeList = snapshot.data;

                        return ListView.builder(
                            itemCount: shoeList!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final shoe = shoeList[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                //New Shoe
                                child: NewShoeWdg(shoe: shoe),
                              );
                            });
                      }
                    }))
          ],
        )
      ],
    );
  }
}
