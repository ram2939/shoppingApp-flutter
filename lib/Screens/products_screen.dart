import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
class ProductsScreen extends StatefulWidget {
  final String searchText;
  ProductsScreen(this.searchText);
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}


class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> items=[
    Product(
      name: "MI Tv",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a Mi TV"
    ),
    Product(
      name: "LG TV",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a LG TV"
    ),
  ];
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
          return ProductItem(items[index]);
        },
      ),
    );
  }
}