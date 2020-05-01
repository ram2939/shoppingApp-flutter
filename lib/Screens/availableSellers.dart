import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/productSeller.dart';

import '../AppRepository.dart';

class AvailableSellers extends StatelessWidget {
  String id;
  AvailableSellers(this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.2,
      child: FutureBuilder(
            future:Provider.of<AppRepository>(context,listen: false).getSellers(id),
            builder:(context,snapshot){ 
              if(snapshot.hasData){ 
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,i){
                    return Seller(snapshot.data[i]);
                  },
                  
                  );
              }
              else return Container(
                child: Text("data note found"),
              );
            },
          ),
      
    );
  }
}
class Seller extends StatelessWidget {
  ProductSeller seller;
  Seller(this.seller);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
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
    );
  }
}