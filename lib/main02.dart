import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Person.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      theme: ThemeData(primaryColor: Colors.yellow),
      home: HomePageWidget(title: "传入的title2222", click: ()=>{
          print("点击了一次222222222")
      },)
    );
  }
}

class HomePageWidget extends StatelessWidget {

  String title = "flutter app";

  VoidCallback click;

  HomePageWidget({this.title, this.click});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
        backgroundColor: Colors.yellow,
      ),
      body: GestureDetector(
        child: Center(
          child: Text(
            "aaaaa",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        onTap: this.click,
      ),
    );
  }
}
