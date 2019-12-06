import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Person.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  var person = Person("wjj", age: 20);

  var userData = UserData<Person>();

  String _getUserInfo() {
    userData.getUserData(person).getString();
    return person.getString();
  }

  String userInfo() => person.getString("ddxse");

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontSize: 15.0,
                color: Color.fromARGB(233, 150, 150, 150),
              ),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: 100.0,
              height: 100.0,
              color: Colors.red,
              child: Image.network(
                "http://img.zcool.cn/community/01b078574706206ac72525ae0beaed.jpg@2o.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(
          Icons.save,
          color: Colors.red,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
