import 'package:flutter/material.dart';
import '../Screens/cart.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:<Widget>[
          Card(
            elevation: 5,
              child: GestureDetector(
              child: Text("Home"),
              onTap: (){

              },),
          ),
            GestureDetector(
            child: Text("Cart"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()) );
            },),
      
        ]
        ),
      
    );
  }
}