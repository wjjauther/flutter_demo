import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/res/ImageResource.dart';

import 'c_page_view.dart' as page;

//ViewPage入坑、不能缓存之前的页面，修改源码的方式可以解决。

class CategoryItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewWidgetState();
  }
}

class _PageViewWidgetState extends State<CategoryItemPage>
    with AutomaticKeepAliveClientMixin {
  int _currentPageIndex = -1;
  Timer timer;

  @override
  void initState() {
    super.initState();
    bannerAutoScroll();
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      print("bannerAutoScroll2");
      timer.cancel();
      timer = null;
    }
  }

  var _pageController = new PageController(initialPage: 0);

  void bannerAutoScroll() {
    print("bannerAutoScroll");
    timer = Timer.periodic(const Duration(seconds: 5), (pragma) {
      if (_currentPageIndex >= 0) {
        _pageController.animateToPage(_currentPageIndex + 1,
            duration: Duration(milliseconds: 800), curve: Curves.ease);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 160.0,
          color: Colors.white,
          child: page.PageView.builder(
            itemBuilder: (BuildContext context, int index) {
              _currentPageIndex = index;
              return Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Stack(fit: StackFit.loose, children: <Widget>[
                  ClipRRect(
                    child: Image.network(
                      bannerImageUrl[index % bannerImageUrl.length],
                      fit: BoxFit.fill,
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "$index",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ))
                ]),
              );
            },
            itemCount: 10000,
            controller: _pageController,
            offscreenPageLimit: 0.0,
            onPageChanged: (value) {
              print(value);
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
