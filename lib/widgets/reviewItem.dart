import '../models/review.dart';
import '../Screens/ViewImage.dart';
import 'package:flutter/material.dart';
class ReviewItem extends StatelessWidget {
  final Review review;
  ReviewItem(this.review);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Text(review.ratings.toString()+"★",
                style: TextStyle(
                  color: Colors.white
                ),),
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(review.heading),
              )
            ],
          ),
          Text(review.date),
          // Center(child: Text(review.review),),
          Container(
            // width: double.infinity,
            height: 100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                // scrollDirection: Axis.horizontal,
                // itemCount: review.images.length,
              children: review.images.map((f){
                var image=Image(image: NetworkImage(f));
                return Container(
                  width: 100,
                  height: 80,
                  child: Hero(tag: review.images.indexOf(f), child: GestureDetector(
                    child: image,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewImage(image,f)));
                },
                )
                  )
                );
              }
              ).toList()
              ),
            ),
          )
        ],
      ),
      
    );
  }
}
