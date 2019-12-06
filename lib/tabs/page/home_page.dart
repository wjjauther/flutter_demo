import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/listview/ListViewImp.dart';

class HomeItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeItemPage();
  }
}

class _HomeItemPage extends State<HomeItemPage> {
  @override
  Widget build(BuildContext context) {
    return new MyScaffold();
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "route静态跳转",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/ShoppingCar"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text("List&页面跳转"),
                    onPressed: () => {
                      //传入一个值，把这个值就是要显示的ListView的条数，是个随机数。
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyListViewImp(50)))
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "ListView",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/ListView"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "Progress",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/ShowProgress"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "State研究",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/stateTest"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "inherited 研究",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/inherited"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "provider",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/provider"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "ChangeNotifierProviderTest",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushNamed("/ChangeNotifierProviderTest"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "WidgetProviderTest",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed("/WidgetProviderTest"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: RaisedButton(
                    child: Text(
                      "页面跳转与页面间传值",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                           return Text("12344");
                        }));
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
