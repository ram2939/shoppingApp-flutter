import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/Screens/home_screen.dart';
import 'package:shopping_app/Screens/loginPage.dart';

// import './Screens/home_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AppRepository _repository = new AppRepository();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AppRepository>(
        create: (BuildContext context) {
          return _repository;
        },
        child: MaterialApp(
          routes: {
            '/home': (context) => HomeScreen(),
          },
          title: 'ShopAIO',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //  home:HomeScreen()
          home: LoginPage(),
        ));
  }
}
