import 'package:flutter/material.dart';
import 'package:flutter_app/provider_test/User.dart';
import 'package:flutter_app/state/TodoProvider.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.hashCode);
    return MaterialApp(
      title: "Provider Test",
      theme: ThemeData(primaryColor: Colors.blue),
      home: ChangeNotifierProvider<User>(
        builder: (_) => new User("", 26),
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<User>(context).dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(context.hashCode);
    var _phonecontroller = new TextEditingController();
    _phonecontroller.text = Provider.of<User>(context).name;
    _phonecontroller.selection = TextSelection.fromPosition(TextPosition(
        affinity: TextAffinity.downstream,
        offset: Provider.of<User>(context).name.length));
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Provider",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.topLeft,
            height: 100.0,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                        onChanged: (changed) =>
                            Provider.of<User>(context).name = changed,
                        controller: _phonecontroller,
                        decoration: InputDecoration(
                            hintText: '请输入用户名',
                            suffixIcon: IconButton(
                                icon: Icon(Icons.clear, color: Colors.black45),
                                onPressed: () {
                                  _phonecontroller.clear();
                                  Provider.of<User>(context).name = "";
                                })))),
                Expanded(
                  child: Text(
                    Provider.of<User>(context).name,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
