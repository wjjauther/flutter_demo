import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Person.dart';

void main() {
  runApp(new MaterialApp(
    title: "My App",
    home: MyScaffold(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter app",
      theme: ThemeData(primaryColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutter App"),
        ),
        body: Center(
          child: Text(
            "Hello world!!",
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        SizedBox(
          height: 25.0,
          child: new Container(
            color: Colors.blue,
            height: 25.0,
          ),
        ),
        new Container(
          height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
          decoration: new BoxDecoration(
            color: Colors.blue,
          ),
          // Row 是水平方向的线性布局（linear layout）
          child: new Row(
            //列表项的类型是 <Widget>
            children: <Widget>[
              new IconButton(
                alignment: Alignment.center,
                color: Colors.white,
                padding: const EdgeInsets.all(1.0),
                icon: new Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                tooltip: 'Navigation menu',
                onPressed: null, // null 会禁用 button
              ),
              // Expanded expands its child to fill the available space.
              new Expanded(
                child: title,
              ),
              new IconButton(
                color: Colors.white,
                padding: const EdgeInsets.all(1.0),
                icon: new Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                tooltip: 'Search',
                onPressed: null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              '自定义AppBar',
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello, world!'),
            ),
          ),
          new Expanded(
            child:  Counter(),
          )
         
        ],
      ),
    );
  }
}


//事件
class Counter extends StatefulWidget{
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter>{

  int _count = 0;

  void _increment(){
      setState(() {
          _count++; 
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          textColor: Colors.red,
          child: Text("Increment"),
          onPressed: _increment,
        ),
        Text("点击后的值为：$_count")
      ],
    );
  }
}
