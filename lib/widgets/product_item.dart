import 'package:flutter/material.dart';
import '../models/product.dart';
class ProductItem extends StatelessWidget {
  final Product item;
ProductItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          GridTile(child: Image(image: NetworkImage(item.image))),
          GridTileBar(
            backgroundColor: Colors.black54,
            title: Center(child: Text(item.name)),
            leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: (){},
            ),
            trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){}),
          )
        ],
        
      ),
    );
  }
}