import 'package:flutter/material.dart';
// import 'package:shopping_app/Screens/products_screen.dart';
import 'package:shopping_app/widgets/searchBar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchBar searchBar;
    searchBar=SearchBar(onPressed: (){
    Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen(searchBar.getSearch())));
  },
  );

    return Scaffold(
        body: ListView(
          children: <Widget>[
            searchBar
          ],
        ),      
    );
  }
}