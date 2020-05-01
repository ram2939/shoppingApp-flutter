// import 'package:shopping_app/AppRepository.dart';
// import 'dart:convert';

// import 'package:provider/provider.dart';
// import 'package:shopping_app/AppRepository.dart';
// import 'package:shopping_app/models/review.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/Screens/availableSellers.dart';
// import 'package:shopping_app/models/productSeller.dart';
import 'package:shopping_app/widgets/productDesc.dart';
// import 'package:shopping_app/widgets/reviewItem.dart';
import 'package:shopping_app/widgets/reviewsandRatings.dart';

import '../models/product.dart';
import '../widgets/imageSlider.dart';


class ProductDetails extends StatelessWidget {
  final Product product;
  // final Review review=Review(ratings: 4,heading:"Must buy",date: "12/04/2020",review: "It is an excellent product",images: ["https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70","https://rukminim1.flixcart.com/image/416/416/jt8yxe80/refrigerator-new/x/k/n/gl-b201aspy-5-lg-original-imafemyzvrczxtqf.jpeg?q=70"]);
  List<String> array;
  ProductDetails(this.product);
  // Future<List<Review>> getReviews() async{
  // }
  
  @override
  Widget build(BuildContext context) {
  // Future<Review> getReview() async{
  //             var response=await Provider.of<AppRepository>(context).fetchReviews("abc");
  //             final parsed=jsonDecode(response.body) as List;
  //             return Review.fromJson(parsed[0]);
  //           }
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
            child: Text("Sold by: "+product.sellerName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.description),
          ),
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text("Details"),
          ),
          ProductDescription(),
          ListTile(
                      title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text("Seller"),
              Text("Price")
            ],),
          ),
          AvailableSellers(product.id),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReviewRatingContainer(product),
          ),

          // FutureBuilder(
          //   future:Provider.of<AppRepository>(context,listen: false).fetchReviews(product.id),
          //   builder:(context,snapshot){ 
          //     if(snapshot.hasData){ 
          //       return Container(
          //         child:Column(
          //           children: <Widget>[
                      
          //             snapshot.data.length>2
          //             ? ReviewItem(snapshot.data[0]),Re
          //             : Text("No reviews") 
          //           ],
          //         ),
          //       );
          //     }
          //     else return Container();
          //   },
          // ),
          Row(
            children: <Widget>[
              FlatButton(onPressed: (){
                // ProductSeller(id: product.sellerID,price: product.price,
                Fluttertoast.showToast(msg: "Successfully Added to cart");
                // Provider.of<AppRepository>(context,listen: false).addToCart(product,);
              }, child: Text("Add to Cart")),
              FlatButton(onPressed: (){
                Fluttertoast.showToast(msg: "Successfully Added to Favorites");
                Provider.of<AppRepository>(context,listen: false).addToFavorite(product);
              }, child: Text("Add to Favorites")),
            ],
          )
          // 
        ],
        
      ),
    );
  }
}