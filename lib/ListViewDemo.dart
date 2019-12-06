import 'dart:io';

import 'package:flutter/material.dart';

//ListView 组件的使用

class ListViewDemo extends StatelessWidget {
  List<String> imageUrl = [
    "http://b.hiphotos.baidu.com/image/pic/item/908fa0ec08fa513db777cf78376d55fbb3fbd9b3.jpg",
    "http://f.hiphotos.baidu.com/image/pic/item/0e2442a7d933c8956c0e8eeadb1373f08202002a.jpg",
    "http://b.hiphotos.baidu.com/image/pic/item/0eb30f2442a7d9337119f7dba74bd11372f001e0.jpg"
  ];

  String _getImageUrl(int index) {
    HttpClient();
    return imageUrl[index % imageUrl.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewDemo"),
      ),
      body: new ListView.separated(
        padding: EdgeInsets.all(10.0),
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 0.5,
            margin: EdgeInsets.only(left: 10.0, right: 10.0),
            color: Colors.red,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: new Container(
                    width: 50.0,
                    height: 50.0,
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      child: Image.network(
                        _getImageUrl(index),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    constraints: BoxConstraints.expand(
                      //对Image的约束
                      width: 50.0, //w填充屏幕
                      height: 50.0,
                    )), //h填满屏幕
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 10),
                          height: 50.0,
                          child: Text("data-$index")),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 10),
                          height: 50.0,
                          child: Text("data2-$index")),
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
