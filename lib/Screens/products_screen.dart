import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/AppRepository.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
class ProductsScreen extends StatefulWidget {
  final String searchText;
  final List<Product> list;
  ProductsScreen(this.searchText,this.list);
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}


class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> items;

  // List<Product> items=[
  //   Product(
  //     name: "MI Tv",
  //     image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
  //     description: "This is a Mi TV",
  //     price: 25000,
  //     ratings: 4.4,
  //     isFavorite: false
  //   ),
  //   Product(
  //     name: "LG TV",
  //     image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
  //     description: "This is a LG TV",
  //     price: 44000,
  //     ratings: 4.2,
  //     isFavorite: true
  //   ),
  // ];
      @override
      void initState(){
        items=widget.list;
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Search Results for ${widget.searchText}"),
          ),      
          body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index){
          return ProductItem(items[index],true);
        },
      ),
    );
  }
}