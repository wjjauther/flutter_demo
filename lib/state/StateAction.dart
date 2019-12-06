import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/state/TodoProvider.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class StateAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: new Users(),
      child: MaterialApp(
        title: "StateTest",
        theme: ThemeData(primaryColor: Colors.blueGrey),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "List",
            ),
          ),
          key: _scaffoldKey, //根据key 找到 Widget
          body: Consumer(
            builder: (_, Users value, child) => ListView.builder(
              itemCount: value.getListCount(),
              itemBuilder: (_, index) => Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      value.list[index].userName,
                      style: TextStyle(color: Colors.red, fontSize: 16.0),
                    ),
                    trailing: Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "编辑",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "删除",
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestState extends StatefulWidget {
  final List<UserInfo> _list;

  TestState(this._list);

  @override
  _TestState createState() => _TestState(_list);
}

class _MyScreenState extends State<TestState> {
  /// the unique identity of the Scaffold
  ///

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: RaisedButton(
            child: new Text('Hit me'),
            onPressed: () {
              _scaffoldKey.currentState.showSnackBar(new SnackBar(
                content: new Text('This is the Snackbar...'),
              ));
            }));
  }
}

class Product2 {
  String _name;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Test _test;

  Test get test => _test;

  set test(Test value) {
    _test = value;
    _test.text(1, "das", true);
  }
}

class Test {
  text3(int index, String name, bool isOk) => text2(name, isOk);

  text(int index, String name, bool isOk) => (name, isOk) {
        var product = new Product2();
        product.name = "ssss";
        String getName = product.name;
      };

  text2(String name, bool ok) {
    print(name);
  }
}

class _TestState extends State<TestState> {
  final List<UserInfo> _list;

  _TestState(this._list);

  int _count = 0;

  Random _random;

  int get count => _count;

  @override
  void initState() {
    super.initState();
    print("初始化 count 值");
    _count = 100;
    _random = new Random();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(TestState oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  _getRandomNumber() {
    setState(() {
      _count = _random?.nextInt(1000);
    });
  }

  _getTextStyle() {
    return (_count % 2 == 0)
        ? TextStyle(color: Colors.red)
        : TextStyle(color: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$_count",
            style: _getTextStyle(),
          ),
          RaisedButton(
            child: Text("点击产生一个随机数"),
            onPressed: _getRandomNumber,
          ),
          RaisedButton(
              child: new Text('Hit me'),
              onPressed: () {
                RenderBox renderBox = _scaffoldKey.currentContext.findRenderObject();
                renderBox.localToGlobal(Offset.zero);

                _scaffoldKey.currentState.showSnackBar(new SnackBar(
                  content: new Text('This is the Snackbar...'),
                ));
              }),
          Text(
            "${_list[Random().nextInt(10) % _list.length].userName}",
            style: _getTextStyle(),
          ),
          Text(
            "$_count",
            style: _getTextStyle(),
          ),
        ],
      ),
    );
  }
}
