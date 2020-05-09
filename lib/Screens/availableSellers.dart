import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Screens/seller.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/seller.dart';
import 'package:shopping_app/models/productSeller.dart';
import 'package:shopping_app/utils/navigation.dart';
import 'package:shopping_app/utils/sizeConfig.dart';

import '../AppRepository.dart';

class AvailableSellers extends StatelessWidget {
  final String id;
  AvailableSellers(this.id);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FutureBuilder(
            future:Provider.of<AppRepository>(context,listen: false).getSellers(id),
            builder:(context,snapshot){ 
              if(snapshot.hasData){ 

                return Column(
                  children: <Widget>[
                    ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("All Sellers"),
                    // Text("Price")
                  ],
                ),
              ),
                    Container(
                      // color: Colors.red,
                      height: SizeConfig.safeBlockVertical*8*snapshot.data.length,
                      child: Column(
                        // itemCount: snapshot.data.length,
                        children: 
                        // snapshot.data.forEach()
                        snapshot.data.map<Widget>((values){
                          return PSeller(values);
                        }).toList(),
                        
                        ),
                    ),
                  ],
                );
              }
              else return Container(
                child: Text("Sorry! No sellers found"),
              );
            },
          );
  }
}
class PSeller extends StatelessWidget {
  final ProductSeller seller;
  PSeller(this.seller);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Seller s=new Seller(id: seller.id,name: seller.name,picture: "https://image.shutterstock.com/image-illustration/very-big-size-man-without-260nw-126920099.jpg");
              Navigate.push(context, SellerPage(s));
              // go to sellers page
            },
            child: Text(seller.name,
            style: TextStyle(
              // color: Colors.red
              decoration: TextDecoration.underline
            ),)),
          Text("₹ "+seller.price.toString())
        ],
      ),
      trailing: FlatButton(color: Colors.black12, onPressed: (){
        Fluttertoast.showToast(msg: "Added to Cart");
        Product pr=Provider.of<Product>(context,listen: false);
        pr.sellerID=seller.id;
        pr.sellerName=seller.name;
        pr.price=seller.price;
        // print(pr.sellerName
        // );
        Provider.of<AppRepository>(context,listen: false).addToCart(pr);
      }, child: Text("Add to cart")),
    );
  }
}