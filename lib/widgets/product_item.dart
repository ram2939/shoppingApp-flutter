import 'package:flutter/material.dart';
import '../models/product.dart';
import '../Screens/ProductDetails.dart';
class ProductItem extends StatelessWidget {
  final Product item;
  final bool showOptions;
ProductItem(this.item,this.showOptions);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        // alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(item)));
            },
            child: GridTile(child: Image(image: NetworkImage(item.image)))),
          Container(
            height: 35,
            child: Center(
              child: showOptions
              ? GridTileBar(
                backgroundColor: Colors.black54,
                title: Center(child: Text(item.name)),
                leading: IconButton(
                  icon: Icon(Icons.favorite),
                  color: item.isFavorite
                  ? Colors.pink
                  : Colors.white
                  ,
                  onPressed: (){
                  },
                ),
                trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){}),
              )
              : Text(item.name)
            ),
          )
        ],
        
      ),
    );
  }
}