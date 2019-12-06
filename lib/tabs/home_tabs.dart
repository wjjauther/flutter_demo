import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/tabs/page/category_page.dart';
import 'package:flutter_app/tabs/page/home_page.dart';
import 'package:flutter_app/tabs/page/setting_page.dart';
import 'package:flutter_app/tabs/page/shopping_car_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _homeTabs = const [
    {"title": "首页", "icon": Icons.home},
    {"title": "分类", "icon": Icons.category},
    {"title": "设置", "icon": Icons.settings},
    {"title": "我的", "icon": Icons.near_me},
  ];

  int _currentIndex = 0;

  HomePageBodyWidget _body;

  @override
  Widget build(BuildContext context) {
    _body = HomePageBodyWidget((pageIndex) {
      setState(() {
        this._currentIndex = pageIndex;
      });
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0.5,
          titleSpacing: 10.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "惠州",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0),
              ),
              Image.asset(
                "images/icon_down.png",
                width: 12,
                height: 18,
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  height: 30.0,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "刮最高1111红包",
                              style: TextStyle(
                                  color: Colors.black12, fontSize: 13.0),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Icon(
                            Icons.keyboard_voice,
                            color: Colors.black,
                            size: 18,
                          ),
                          margin: EdgeInsets.only(right: 8.0),
                        ),
                      ),
                    ],
                  ),
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      width: 1.0,
                      color: Color.fromARGB(255, 246, 246, 246),
                    ),
                    color: Color.fromARGB(255, 246, 246, 246),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 10, 0),
              child: Image.asset(
                "images/sao.png",
                width: 16,
                height: 16,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Image.asset(
                "images/add.png",
                width: 16,
                height: 16,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
          brightness: Brightness.light,
        ),
      ),
//      _pageList[_currentIndex]
      body: this._body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: _homeTabs
            .map<BottomNavigationBarItem>((e) => BottomNavigationBarItem(
                icon: Icon(e['icon']), title: Text(e['title'])))
            .toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            this._body.pageTo(index);
          });
        },
      ),
    );
  }
}

class HomePageBodyWidget extends StatefulWidget {
  final ValueChanged<int> pageChange;

  HomePageBodyWidget(this.pageChange, {Key key}) : super(key: key);

  var _pageList = [
    HomeItemPage(),
    CategoryItemPage(),
    SettingItemPage(),
    ShoppingCarItemPage()
  ];

  PageController _pageController = PageController(initialPage: 0);

  var _state = _HomePageBodyWidgetState();

  @override
  State<StatefulWidget> createState() {
    return _state;
  }

  void pageTo(pageIndex) {
    _pageController.jumpToPage(pageIndex);
  }
}

class _HomePageBodyWidgetState extends State<HomePageBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return widget._pageList[index];
      },
      itemCount: widget._pageList.length,
      controller: widget._pageController,
      onPageChanged: (pageIndex) {
        if (widget.pageChange != null) {
          widget.pageChange(pageIndex);
        }
      },
    );
  }
}
