import 'package:flutter/material.dart';
import 'package:flutter_app/provider_test/Widget.dart';
import 'package:flutter_app/provider_test/WidgetItem.dart';
import 'package:provider/provider.dart';

class WidgetProviderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.hashCode);
    return MaterialApp(
      title: "Provider Test",
      theme: ThemeData(primaryColor: Colors.blue),

      /// home: ChangeNotifierProvider<Items>(builder: (_) => Items(), child: MyProviderPage(),),
      home: MyProviderPage(),
    );
  }
}

class MyProviderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProviderPageState();
}

class _MyProviderPageState extends State<MyProviderPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Items>(
      builder: (_) => Items(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "局部刷新",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ),
        body: Column(
          children: <Widget>[
            WidgetAA(),
            Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  WidgetBB(),
                  WidgetCC(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
