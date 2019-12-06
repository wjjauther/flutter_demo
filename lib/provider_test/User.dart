
import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _name;

  int _age;


  User(this._name, this._age);

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }
}
