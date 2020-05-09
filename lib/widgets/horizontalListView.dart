
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/sizeConfig.dart';
import '../models/product.dart';
import './productGriditem.dart';
class HorizontalList extends StatelessWidget{
  final List<Product> listOfProducts;
  HorizontalList(this.listOfProducts);
  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);
    return 
    Container(
      height: SizeConfig.safeBlockVertical*22,
      child:new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listOfProducts.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: SizeConfig.safeBlockHorizontal*42,
              child: ProductGridItem(listOfProducts[index]),),
          );
        })
    );
  }
}