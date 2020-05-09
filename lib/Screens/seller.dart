import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/seller.dart';
import 'package:shopping_app/widgets/horizontalListView.dart';

import '../AppRepository.dart';
// import 'package:shopping_app/models/productSeller.dart';

class SellerPage extends StatelessWidget {
  final Seller seller;
  SellerPage(this.seller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(seller.name),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
               CircleAvatar(
                 radius: 100,
                 backgroundColor: Colors.transparent,
                 backgroundImage:
                 NetworkImage(seller.picture)),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: <Widget>[
                     Text(seller.name),
                   ],
                 ),
               ) 
              ],),
          ),
            Divider(thickness: 0.5),
            Text("Products sold: "),
            FutureBuilder(
              future: Provider.of<AppRepository>(context).getSellerProducts(seller.id),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  if(snapshot.data.length>0){  
                  return HorizontalList(snapshot.data);
                }
                else return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("No products found")),
                );
                }
                else return Container(child: Text("Finding"),);
              },
            )
        ],
      ),
      
    );
  }
}