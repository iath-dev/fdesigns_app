import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  late List<Widget> children;
  late bool dotsTop;
  late Color primaryColor;
  late Color secondaryColor;
  late double primarySize;
  late double secondarySize;
  late BoxShape shape;

  double _currentPage = 0;

  SliderModel(this.children);

  double get currentPage => _currentPage;

  set currentPage(double page) {
    _currentPage = page;

    notifyListeners();
  }
}
