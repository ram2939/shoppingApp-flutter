import '../widgets/imageSlider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
class ProductDetails extends StatelessWidget {
  final Product product;
  ProductDetails(this.product);
  List<String> array;
  @override
  Widget build(BuildContext context) {
    array=[product.image,product.image,product.image];
    return Scaffold(
          body: ListView(
        children: <Widget>[
          ImageSlider(array),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(product.name),
                Text("Rs "+
                  product.price.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.description),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${product.ratings}/5.0 Ratings"),
          ),
        ],
        
      ),
    );
  }
}