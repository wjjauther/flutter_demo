import 'package:flutter/material.dart';

class PageViewScrollDelegate extends ChangeNotifier {
  int _currentPageIndex = -1;

  int get currentPageIndex => _currentPageIndex;

  set currentPageIndex(int value) {
    _currentPageIndex = value;
    notifyListeners();
  }
}
