import 'package:flutter/material.dart';

class UserInfo {
  String userName;

  int age = 0;

  UserInfo({this.userName, this.age});
}

class Users with ChangeNotifier {
  List<UserInfo> _list = <UserInfo>[
    UserInfo(userName: "zhangsan", age: 20),
    UserInfo(userName: "lisi", age: 24),
    UserInfo(userName: "wangwu", age: 30),
    UserInfo(userName: "zhaoliu", age: 26),
  ];


  List<UserInfo> get list => _list;

  getListCount() {
    return _list.length;
  }

  refresh() {
    notifyListeners();
  }

  getUserInfo(index) {
    return _list[index];
  }

  addUser(UserInfo userInfo) {
    _list.add(userInfo);
    refresh();
  }

  updateUser(index, userName, [age]) {
    var userIndex = _list[index];
    userIndex.userName = userName;
    userIndex.age = age;
    refresh();
  }

  @override
  String toString() {
    _list.forEach((e) => {print("UserName:${e.userName},Age:${e.age}")});
    return super.toString();
  }
}
