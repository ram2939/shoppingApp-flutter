import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/productPage.dart';
import 'package:shopping_app/models/cartItem.dart';
import 'package:shopping_app/utils/navigation.dart';

class CartItem extends StatelessWidget {
  final Function removeCallback;
  final Function changeQuantity;
  final cartItem item;
  final int index;
  CartItem(this.item, this.removeCallback, this.changeQuantity, this.index);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(0),
            onTap: () {
              Navigate.push(context, ProductPage(item.product));
            },
            leading: Container(
              height: 200,
              child: Image(image: NetworkImage(item.product.image)),
            ),
            title: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(item.product.name,style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(item.sellerName,style: TextStyle(fontSize: 12),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: <Widget>[
                        Text("₹ "),
                        Text(item.price.toString(),
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 25)),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: null, child: Quantity(1, changeQuantity, index))
                ],
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                removeCallback(item);
              },
              icon: Icon(Icons.delete),
            ),
          ),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}

class Quantity extends StatefulWidget {
  final int quantity;
  final int index;
  final Function changeQuantity;
  Quantity(this.quantity, this.changeQuantity, this.index);
  @override
  _QuantityState createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int quantity;
  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 35,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Card(
              elevation: 1.5,
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      // if(quantity>1)
                      // {
                      widget.changeQuantity(widget.index, false);
                      setState(() {
                        quantity--;
                      });
                      // }
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
                decoration: BoxDecoration(color: Colors.white),
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
                    onTap: () {
                      widget.changeQuantity(widget.index, true);
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
