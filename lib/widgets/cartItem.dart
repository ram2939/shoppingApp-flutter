import 'package:flutter/material.dart';
import '../models/product.dart';
class CartItem extends StatelessWidget {
  final Product item;
  CartItem(this.item);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Image(image: NetworkImage(item.image),),
      title: Text(item.name),
      
    );
  }
}