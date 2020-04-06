import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/cartItem.dart';
class Cart extends StatelessWidget {
  final List<Product> items=[
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
      appBar: AppBar(title: Text("Cart"),),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i){
          return CartItem(items[i]);
        }),
      
    );
  }
}