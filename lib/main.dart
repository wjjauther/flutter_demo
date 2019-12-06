import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/ProgressDialog.dart';
import 'package:flutter_app/inherited/InheritedWidgetDemo.dart';
import 'package:flutter_app/provider_test/ChangeNotifierProviderTest.dart';
import 'package:flutter_app/provider_test/ProviderTest.dart';
import 'package:flutter_app/provider_test/WidgetProviderTest.dart';
import 'package:flutter_app/tabs/home_tabs.dart';

import 'ShoppingCart.dart';
import 'douban.dart';
import 'state/StateAction.dart';

void main() {
  runApp(
    new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/ShoppingCar": (_) => ShoppingList(
              products: <Product>[
                new Product(name: "Eggs"),
                new Product(name: "Flour"),
                new Product(name: "Chocolate chips"),
                new Product(name: "Apple"),
              ],
            ),
        "/ListView": (_) => DouBanListView(),
        "/ShowProgress": (_) => MyApp(),
        "/stateTest": (_) => StateAction(),
        "/inherited": (_) => InheritedWidgetDemo(),
        "/provider": (_) => MyProvider(),
        "/ChangeNotifierProviderTest": (_) => ChangeNotifierProviderTest(),
        "/WidgetProviderTest": (_) => WidgetProviderTest(),
      },
    ),
  );

  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}


