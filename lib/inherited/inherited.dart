import 'package:flutter/material.dart';

class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  MyInheritedWidgetState createState() => new MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context,
      {bool rebuild = true}) {
    return rebuild
        ? (context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited)
            .data
        : (context.ancestorWidgetOfExactType(_MyInherited) as _MyInherited)
            .data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget> {
  List<Item> _items = <Item>[];

  int get itemsCount => _items.length;

  void addItem(String name) {
    setState(() {
      _items.add(new Item(name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _MyInherited(child: widget.child, data: this);
  }
}

class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {
    return true;
  }
}

class Item {
  String name;

  Item(this.name);
}
