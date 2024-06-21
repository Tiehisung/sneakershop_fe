import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sneakershop_fe/models/sneaker_model.dart';
import 'package:sneakershop_fe/views/shared/stagger_title.dart';

class LatestShoesWgt extends StatelessWidget {
  const LatestShoesWgt({
    super.key,
    required Future<List<Sneaker>> categoryShoes,
  }) : _categoryShoes = categoryShoes;

  final Future<List<Sneaker>> _categoryShoes;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _categoryShoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            final males = snapshot.data;
            return SingleChildScrollView(
              child: StaggeredGrid.count(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 20.0, // Spacing between columns
                mainAxisSpacing: 16.0, // Spacing between rows
                axisDirection: AxisDirection.down,
                children: List.generate(
                    males!.length,
                    (index) => StaggerTitleWdgt(
                          shoe: males[index],
                          height: index % 4 == 1 || index % 4 == 3
                              ? MediaQuery.of(context).size.height * 0.35
                              : MediaQuery.of(context).size.height * 0.3,
                        )),
              ),
            );
          }
        });
  }
}
