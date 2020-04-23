import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/productPage.dart';
import 'package:shopping_app/utils/navigation.dart';
import '../models/product.dart';
import '../Screens/ProductDetails.dart';
class ProductGridItem extends StatelessWidget {
  final Product item;
ProductGridItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        // alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          GestureDetector(
            onTap: (){
             Navigate.push(context, ProductPage(item),plain: true);
            },
            child: GridTile(child: Image(image: NetworkImage(item.image)))),
          Container(
            height: 35,
            child: Center(
              // child: showOptions
              // ? GridTileBar(
              //   backgroundColor: Colors.black54,
              //   title: Center(child: FittedBox(
              //     fit: BoxFit.cover,
              //     child: Text(item.name))),
              //   leading: IconButton(
              //     icon: Icon(Icons.favorite),
              //     color: item.isFavorite
              //     ? Colors.pink
              //     : Colors.white
              //     ,
              //     onPressed: (){
              //     },
              //   ),
              //   trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){}),
              // )
              child: Text(item.name)
            ),
          )
        ],
        
      ),
    );
  }
}