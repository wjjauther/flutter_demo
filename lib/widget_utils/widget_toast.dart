//显示 类似于 android 的 Toast
import 'package:flutter/material.dart';

class Toast {
  OverlayState _overlayState;
  OverlayEntry _overlayEntry;

  Toast.show(BuildContext context, String message) {
    _overlayState = Overlay.of(context);

    _overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.8,
          child: Row(
            children: <Widget>[
              new Material(
                  color: Colors.transparent,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: new Center(
                      child: new Card(
                        child: new Padding(
                          padding: EdgeInsets.all(8),
                          child: new Text(message, style: TextStyle(color: Colors.white),),
                        ),
                        color: Colors.black54,
                      ),
                    ),
                  ))
            ],
          ));
    });

    _overlayState.insert(_overlayEntry);

    Future.delayed(Duration(seconds: 2)).then((value) {
      _overlayEntry.remove();
    });
  }
}
