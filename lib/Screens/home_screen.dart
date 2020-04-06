import 'package:flutter/material.dart';
import './products_screen.dart';
class HomeScreen extends StatelessWidget {
  final AppBar _appbar=AppBar(
    title: Text("Welcome to ShopAIO"),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                // padding:EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.8,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search your product"
                  ),
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.search),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen())); 
            },)
          ],
        ),
      ),
      
    );
  }
}