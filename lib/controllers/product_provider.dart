import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePageIndex = 0;

  int get activePageIndex => _activePageIndex;
  set activePageIndex(int newPageIndex) {
    _activePageIndex = newPageIndex;
    notifyListeners();
  }

  List<dynamic> _shoeSizes = [];

  List<dynamic> get shoeSizes => _shoeSizes;
  set shoeSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  //Toggle size selection
  void toggleSelection(int shoeIndex) {
    for (int i = 0; i <= _shoeSizes.length; i++) {
      if (i == shoeIndex) {
        _shoeSizes[i]["isSelected"] = !_shoeSizes[i]["isSelected"];
      }
    }
    notifyListeners();
  }
}
