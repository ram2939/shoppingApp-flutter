import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/drawer.dart';
import '../widgets/horizontalListView.dart';
import '../widgets/searchBar.dart';

class HomeScreen extends StatelessWidget {
  final AppBar _appbar = AppBar(
    title: Text("Welcome to ShopAIO"),
  );
  @override
  Widget build(BuildContext context) {
    List<Product> items = [
      Product(
          id: "bvkbkfbk",
          name: "MI Tv",
          image:
              "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
          description: "This is a Mi TV",
          price: 25000,
          ratings: 4.4,
          isFavorite: false),
      Product(
          id: "sdknvk",
          name: "LG TV",
          image:
              "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
          description: "This is a LG TV",
          price: 44000,
          ratings: 4.2,
          isFavorite: true),
      Product(
          id: "mbsdfjbsdv",
          name: "LG TV",
          image:
              "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
          description: "This is a LG TV",
          price: 44000,
          ratings: 4.2,
          isFavorite: true),
    ];
    SearchBar searchBar;

    catergoryRow(String text) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text),
            FlatButton(
              child:
                  Text("SEE ALL", style: TextStyle(color: Colors.blueAccent)),
              onPressed: () {},
            )
          ],
        ),
      );
    }

    searchBar = SearchBar(
      active: false,
    );
    return Scaffold(
      appBar: _appbar,
      drawer: AppDrawer(),
      body: Container(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            searchBar,
            catergoryRow("Featured Products"),
            HorizontalList(items),
            catergoryRow("Top Choices"),
            HorizontalList(items),
            catergoryRow("Recently Added"),
            HorizontalList(items)
          ],
        ),
      ),
    );
  }
}
