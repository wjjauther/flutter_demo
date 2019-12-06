import 'package:flutter/material.dart';

class WidgetItem {
  String name;

  WidgetItem(this.name);
}

class Items extends ChangeNotifier {
  List<WidgetItem> _list = <WidgetItem>[];

  addItem(WidgetItem item) {
    _list.add(item);
    notifyListeners();
  }

  size() => _list.length;
}
