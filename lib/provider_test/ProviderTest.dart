import 'package:flutter/material.dart';
import 'package:flutter_app/state/TodoProvider.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.hashCode);
    return MaterialApp(
      title: "Provider Test",
      theme: ThemeData(primaryColor: Colors.blue),
      home: MultiProvider(
        providers: [
          Provider<String>.value(value: "String provider."),
          Provider<UserInfo>.value(
              value: UserInfo(userName: "wangjiajun", age: 30)),
          Provider<int>.value(value: 50),
        ],
        child: MyProviderPage(),
      ),
    );
  }
}

class MyProviderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyProviderPageState();
}

/// Provider.of<String>(context)
/// 什么写在 home 里面的组件不行，必须独立出来才行， buildContext有什么不同吗？
/// 测试发现 context确实是不同的两个对象，hashCode是不相同的
///

class _MyProviderPageState extends State<MyProviderPage> {
  @override
  Widget build(BuildContext context) {
    print(context.hashCode);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Provider",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(Provider.of<String>(context)),
                Text("${Provider.of<int>(context)}"),
                Text(
                    "${Provider.of<UserInfo>(context).userName}, age = ${Provider.of<UserInfo>(context).age}"),
              ],
            ),
          ),
        ));
  }
}
