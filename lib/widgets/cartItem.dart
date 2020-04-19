import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/utils/navigation.dart';
import '../models/product.dart';
import '../Screens/ProductDetails.dart';
class CartItem extends StatelessWidget {
  Function callback;
  final Product item;
  CartItem(this.item,this.callback);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: <Widget>[
          ListTile(
            // alignment: AlignmentDirectional.bottomCenter,
                onTap: (){
                  Navigate.push(context, ProductDetails(item));
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
                    // Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child: ratingBar(item.ratings),
                    // ),
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
                    Quantity(1)
                  ],
                ),
              ),
              trailing: IconButton(
                onPressed: (){
                    callback(item);
                },
                icon: Icon(Icons.delete),
              ),
          ),
          Divider(thickness:1,)
        ],
      ),
    );
  }
 
}
class Quantity extends StatefulWidget {
  int quantity;
  Quantity(this.quantity);
  @override
  _QuantityState createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int quantity;
  @override
  void initState(){
    quantity=widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    // BoxShadow boxShadow=BoxShadow(spreadRadius: 2);
    return Container(
      width: 100,
      height: 35,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            // padding: const EdgeInsets.only(left:8.0),
            child: Card(
              elevation: 1.5,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   border: Border.all()
              // ),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    if(quantity>1)
                  setState(() {
                  quantity--;  
                  });
                  
                },
                  child: Icon(Icons.remove)),
                //  onPressed: (){
                //   ),
              ),
            ),
          ),
          Expanded(
                      child: Container(
              // width: 18,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Center(child: Text(quantity.toString()))),
          ),
          Expanded(
            // padding: const EdgeInsets.symmetric(vertical:8.0),
            child: Card(
              elevation: 1.5,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   border: Border.all()
              // ),
              child: Center(
                child: GestureDetector(
                  onTap: (){
                  setState(() {
                  quantity++;  
                  });
                  
                },
                  child: Icon(Icons.add)),
                //  onPressed: (){
                //   ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}