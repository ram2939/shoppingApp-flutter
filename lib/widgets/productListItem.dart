import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/Screens/productPage.dart';
import 'package:shopping_app/utils/navigation.dart';
import '../models/product.dart';
class ProductListItem extends StatelessWidget {
  final Product item;
ProductListItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: <Widget>[
          ListTile(
            // alignment: AlignmentDirectional.bottomCenter,
                onTap: (){
                  Navigate.push(context, ProductPage(item));
                },
                leading: Image(

                    // height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.5,
                    image: NetworkImage(item.image)),
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(item.name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ratingBar(item.ratings),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: <Widget>[
                          Text("₹ "),
                          Text(item.price.toString(),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 25
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
          Divider(thickness:1,)
        ],
      ),
    );
  }
  Widget ratingBar(double rating)
  {
    return RatingBar(
      ignoreGestures: true,
      itemSize: 20,
   initialRating: rating,
   maxRating: rating,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemBuilder: (context, _) => Container(
    //  margin: EdgeInsets.symmetric(horizontal: -5),
     child: Icon(
       Icons.star,
       color: Colors.amber,
     ),
   ),
   onRatingUpdate: (rating) {
     print(rating);
   },
);
  }
}