import 'package:flutter/material.dart';
import 'package:flutter_app/inherited/inherited.dart';

import 'Widget.dart';

/**
 * 组件的局部刷新
 */
class InheritedWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "局部刷新",
      theme: ThemeData(primaryColor: Colors.white),
      home: new MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidget createState() {
    return _MyStatefulWidget();
  }
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "局部刷新",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
        body: Column(
          children: <Widget>[
            WidgetA(),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  WidgetB(),
                  WidgetC(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
