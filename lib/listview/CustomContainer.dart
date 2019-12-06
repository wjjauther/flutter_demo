import 'package:flutter/material.dart';
import 'package:flutter_app/widget_utils/widget_toast.dart';

class CustomContainer extends StatefulWidget {
  
  final Widget child;

  const CustomContainer({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomContainer(this.child);
  }
}

class _CustomContainer extends State<CustomContainer> {
  final Widget child;

  bool _downIndex = false;

  _CustomContainer(this.child);

  _getColors() {
    return _downIndex ? Color.fromRGBO(225, 225, 225, 1.0) : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              Future.delayed(Duration(milliseconds: 100), () {
                setState(() {
                  this._downIndex = false;
                });
              });
              Toast.show(context, "点击显示Toast");
            },
            onTapDown: (_) {
              setState(() {
                this._downIndex = true;
              });
              print("onTapDown");
            },
            onTapCancel: () {
              setState(() {
                this._downIndex = false;
              });
            },
            child: Container(
              color: _getColors(),
              child: this.child,
            ),
          ),
        ),
      ],
    );
  }
}
