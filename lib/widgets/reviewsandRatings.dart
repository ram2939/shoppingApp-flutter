import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class ReviewRatingContainer extends StatelessWidget {
  final Product product;
  final int five=10;
  final int four=7;
  ReviewRatingContainer(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${product.ratings}/5.0 Ratings"),
          ),
          Container(
            color: Colors.grey,
            width: 1,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            Column(
              children: <Widget>[
                ratingBar(five),
                ratingBar(four),
                ratingBar(five)
              ],
            )
          ),

        ],
      ),
    );
  }
  Widget ratingBar(int ratings){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
                    width: 100,
                    height: 12,
                    decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50)
                    ),
                    child: FractionallySizedBox(
                      alignment: AlignmentDirectional.topStart,
                      widthFactor: ratings/(four+five),
                      heightFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green
                        ),
                      ),
                    ),
                  ),
      );
  }
}