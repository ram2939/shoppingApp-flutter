import 'package:shopping_app/models/review.dart';
import 'package:shopping_app/widgets/productDesc.dart';
import 'package:shopping_app/widgets/reviewItem.dart';
import 'package:shopping_app/widgets/reviewsandRatings.dart';

import '../widgets/imageSlider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
class ProductDetails extends StatelessWidget {
  final Product product;
  final Review review=Review(ratings: 4,heading:"Must buy",date: "12/04/2020",review: "It is an excellent product",images: ["https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70","https://rukminim1.flixcart.com/image/416/416/jt8yxe80/refrigerator-new/x/k/n/gl-b201aspy-5-lg-original-imafemyzvrczxtqf.jpeg?q=70"]);
  ProductDetails(this.product);
  List<String> array;
  @override
  Widget build(BuildContext context) {
    array=[product.image,"https://rukminim1.flixcart.com/image/416/416/jt8yxe80/refrigerator-new/x/k/n/gl-b201aspy-5-lg-original-imafemyzvrczxtqf.jpeg?q=70"];
    return Scaffold(
          body: ListView(
        children: <Widget>[
          ImageSlider(array),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(product.name),
                Text("Rs "+
                  product.price.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.description),
          ),
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text("Details"),
          ),
          ProductDescription(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReviewRatingContainer(product),
          ),
          ReviewItem(review),
        ],
        
      ),
    );
  }
}