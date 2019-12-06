import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'WidgetItem.dart';

class WidgetAA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("WidgetAA");
    return Consumer(
      builder: (_, Items value, child) => Container(
        child: new RaisedButton(
          child: new Text(
            'WidgetA Add Item',
            textAlign: TextAlign.right,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onPressed: () {
            value.addItem(new WidgetItem("${new Random().nextInt(1000)}"));
          },
        ),
      ),
    );
  }
}

class WidgetBB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("WidgetBB");
    return Consumer(
      builder: (_, Items value, child) => new Container(
        child: Row(
          children: <Widget>[
            Icon(Icons.shopping_cart),
            Text(
              '${value.size()}',
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetCC extends StatelessWidget {
  _getFontWeight(int size) {
    return size % 2 == 0 ? FontWeight.bold : FontWeight.normal;
  }

  @override
  Widget build(BuildContext context) {
    print("WidgetCC");
    return Consumer(
      builder: (_, Items values, child) => new Text(
        'Widget C',
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: _getFontWeight(values.size()),
          color: Colors.green[200],
        ),
      ),
    );
  }
}
