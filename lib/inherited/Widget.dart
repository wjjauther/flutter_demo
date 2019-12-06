import 'package:flutter/material.dart';
import 'package:flutter_app/inherited/inherited.dart';

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("WidgetA");
    final MyInheritedWidgetState state = MyInheritedWidget.of(context, rebuild: false);
    return new Container(
      child: new RaisedButton(
        child: new Text('WidgetA Add Item',
          textAlign: TextAlign.right,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onPressed: () {
          state.addItem('new item');
        },
      ),
    );
  }
}

class WidgetB extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    print("WidgetB");
    return new Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.shopping_cart),
          Text('${state.itemsCount}',
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("WidgetC");
    return new Text(
      'Widget C',
      textAlign: TextAlign.right,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
//          fontWeight: FontWeight.bold,
        color: Colors.green[200],
      ),
    );
  }
}