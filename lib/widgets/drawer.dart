import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/favorites.dart';
import '../Screens/cart.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
            child: Text("Home"),
            onTap: (){

            },),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
              child: Text("Cart"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()) );
              },),
            ),
        Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
              child: Text("Favorites"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorites()) );
              },),
            ),
        ]
        ),
      
    );
  }
}