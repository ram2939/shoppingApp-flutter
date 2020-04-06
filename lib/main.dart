import 'package:flutter/material.dart';
import './Screens/home_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopAIO',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}

