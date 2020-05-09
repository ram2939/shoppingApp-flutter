import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/productPage.dart';
import 'package:shopping_app/utils/navigation.dart';
import 'package:shopping_app/utils/sizeConfig.dart';

import '../models/product.dart';

class ProductGridItem extends StatelessWidget {
  final Product item;
  ProductGridItem(this.item);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        // alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
            // height: SizeConfig.safeBlockVertical*14,
            child: GestureDetector(
                onTap: () {
                  Navigate.push(context, ProductPage(item), plain: true);
                },
                child: GridTile(child: Image(image: NetworkImage(item.image)))),
          ),
          Container(
            height: SizeConfig.safeBlockVertical*3,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: FittedBox(
                child: Text(item.name)),
            ),
          )
        ],
      ),
    );
  }
}
