import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_app/listview/MessageDialog.dart';
import 'package:flutter_app/listview/project_entity.dart';
import 'package:flutter_app/res/ImageResource.dart';
import 'package:flutter_refresh/flutter_refresh.dart';

import 'CustomContainer.dart';

//实现合力DA首页的listView，结果从网络上去请求接口

class MyListViewImp extends StatefulWidget {
  final int count;

  MyListViewImp(this.count);

  @override
  State<StatefulWidget> createState() {
    return _MyListViewImp();
  }

  
}



class _MyListViewImp extends State<MyListViewImp> {
  var _dataList = <ProjectEntityDataContent>[];

  var _downIndex = -1; //按下时的 Index

  _MyListViewImp();

  _getAdSiteNumber(index) => Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 15.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromRGBO(98, 148, 251, 1.0),
                  width: 1.0,
                  style: BorderStyle.solid),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
            child: Text(
              "${_dataList[index].ggsiteCount}个点位",
              style: TextStyle(
                  fontSize: 13.0, color: Color.fromRGBO(98, 148, 251, 1.0)),
            ),
          ),
        ),
      );

  _getAdSiteImage(index) => Stack(
        children: <Widget>[
          Container(
            width: 90.0,
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              child: Image.network(
                imageUrlList[imageUrlList.length - 1],
                width: 90.0,
                height: 90.0,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
          Container(
            height: 90.0,
            width: 90.0,
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 20.0,
              width: 90.0,
              alignment: Alignment.center,
              /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)),
                  shape: BoxShape.rectangle,
                  color: Colors.white),*/
              color: Color.fromRGBO(0, 0, 0, 0.3),
              child: Text(
                adSiteScene[_dataList[index].scene],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );

  _getColors(index) {
    return _downIndex == index
        ? Color.fromRGBO(245, 245, 245, 1.0)
        : Colors.white;
  }

  _getItem(index) {
    print(index);
    return Column(
      children: <Widget>[
        Container(
//          color: _getColors(index),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: <Widget>[
              _getAdSiteImage(index),
              Container(
                padding: EdgeInsets.only(right: 20.0),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10.0),
                height: 90.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _dataList[index].projectName,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromRGBO(51, 51, 51, 1.0)),
                      ),
                      flex: 2,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Expanded(
                      child: Text(
                        "距离市中心>${(_dataList[index].distanceFromDowntown / 1000.0).toStringAsFixed(2)}km",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(93, 93, 93, 1.0)),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: _getAdSiteNumber(index),
                      flex: 4,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 90.0,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 10.0),
                          height: 90.0,
                          child: Image.asset(
                            "images/icon_by.png",
                            width: 35,
                            height: 35,
                            fit: BoxFit.fill,
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(bottom: 5.0),
                          height: 90.0,
                          child: Text(
                            '￥${_dataList[index].projectLowerPrice.toStringAsFixed(0)}-${_dataList[index].projectHighestPrice.toStringAsFixed(0)}/周',
                            style: TextStyle(
                                color: Color.fromRGBO(230, 80, 79, 1.0),
                                fontSize: 12.0),
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _showDialog(BuildContext context, int index) {
    prefix0.showDialog(
        context: context,
        builder: (_) => MessageDialog(
            title: "提示",
            message: "this is $index content",
            negativeText: "取消",
            positiveText: "确定",
            onPositivePressEvent: () {},
            onCloseEvent: () {
              Navigator.of(context).pop();
            }));
  }

  //网络请求数据
  Future<Null> _getDataFromNetWork() async {
    try {
      String url =
          "http://ggunionapi.shaxuntech.com/mis/api/v1/public/rest/projects?page=2&pageSize=10&projectName=&cityCode=441300";
      Dio dio = new Dio();
      Response response = await dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        var _result = response.data;
        _decodeJson(_result);
      } else {
        print("请求失败");
      }
    } catch (exception) {
      print("网络异常-$exception");
    }
  }


  //json => Map
  //jsonArray => List
  _decodeJson(Map jsonData) {
    if (jsonData['meta'] != null) {
      if (jsonData['meta']['errcode'] == 0) {
        print('请求成功，并且服务器未发生错误。');
        if (jsonData['data'] != null) {
          var contentList =
              jsonData['data']['content'] as List; //泛型能否解决这个解析问题？？
          contentList.forEach((item) {
            _dataList.add(ProjectEntityDataContent.fromJson(item));
          });
          setState(() {});
        }
      } else {
        print('请求成功，可能服务内部存在错误。');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getDataFromNetWork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Text(
            "网点列表",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Refresh(
          onFooterRefresh: _getDataFromNetWork,
          onHeaderRefresh: _getDataFromNetWork,
          childBuilder: (BuildContext context, {ScrollController controller, ScrollPhysics physics}) =>
              Container(
                child: ListView.separated(
                  controller: controller,
                  physics: physics,
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) => CustomContainer(
                    child: _getItem(index),
                  ),
                  separatorBuilder: (context, index) => Container(
                    height: 0.5,
                    color: Color.fromRGBO(245, 245, 245, 1.0),
                  ),
                ),
              )),
    );
  }
}

