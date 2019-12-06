import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  //子布局
  final Widget child;

  //加载中是否显示
  final bool loading;

  //进度提醒内容
  final String msg;

  //加载中动画
  final Widget progress;

  //背景透明度
  final double alpha;

  //字体颜色
  final Color textColor;

  ProgressDialog(
      {Key key,
        @required this.loading,
        this.msg,
        this.progress = const CircularProgressIndicator(),
        this.alpha = 0.6,
        this.textColor = Colors.white,
        @required this.child})
      : assert(child != null),
        assert(loading != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (loading) {
      Widget layoutProgress;
      if (msg == null) {
        layoutProgress = Center(
          child: progress,
        );
      } else {
        layoutProgress = Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(4.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                progress,
                Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                  child: Text(
                    msg,
                    style: TextStyle(color: textColor, fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        );
      }
      widgetList.add(Opacity(
        opacity: alpha,
        child: new ModalBarrier(color: Colors.black87),
      ));
      widgetList.add(layoutProgress);
    }
    return Stack(
      children: widgetList,
    );
  }
}

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow),
      title: "",
      home: MyHomePage(
        title: "加载动画",
      ),
    );
  }
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
      home: MyHomePage(title: '加载动画'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ProgressDialog(
        loading: _loading,
        msg: '正在加载...',
        child: Center(
          child: RaisedButton(
            onPressed: () => _onRefresh(),
            child: Text('显示加载动画'),
          ),
        ),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    setState(() {
      _loading = !_loading;
    });
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = !_loading;
//        Toast.show(context, "加载完成");
      });
    });
  }
}
