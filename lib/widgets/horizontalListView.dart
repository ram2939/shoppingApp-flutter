
import 'package:flutter/material.dart';
import '../models/product.dart';
import './product_item.dart';
class HorizontalList extends StatelessWidget{
  final List<Product> listOfProducts;
  HorizontalList(this.listOfProducts);
  @override
  Widget build(BuildContext context){
    return 
    Container(
      height: MediaQuery.of(context).size.height*0.21,
      child:new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listOfProducts.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width*0.45,
              child: ProductItem(listOfProducts[index],false),),
          );
        })
    );
  }
}