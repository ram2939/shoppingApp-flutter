import 'package:flutter/material.dart';

class Navigate{
static push(BuildContext context, Widget widget,{bool plain=false}){
  return 
  Navigator.push(context,
  PageRouteBuilder(
  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return widget;
  },
  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    var begin = plain?Offset(0.0, 0.0):Offset(1.0, 0.0);
  var end = Offset.zero;
  var tween = Tween(begin: begin, end: end);
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
  },
)
);
  }
}