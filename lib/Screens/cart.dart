import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/models/cartItem.dart';
import '../models/product.dart';
import '../widgets/cartItem.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double total=0;
  removeProduct(cartItem item){
      setState(() {
      items.remove(item);
      total-=item.price*item.itemQuantity;  
      });
      Fluttertoast.cancel();
      Fluttertoast.showToast(msg: "${item.product.name} removed from cart");
      print("Hello");
      
  }
  changeQuantity(int index,bool increase){
    if(increase)
    {items[index].quantity++;
    
    setState(() {
      total=total+items[index].price;
    });  
    }
    else 
    {items[index].quantity--;
    print(items[index].quantity);
    setState(() {
      total=total-items[index].price;
    });
    }
    }

  @override
  void initState(){
    for(int i=0;i<items.length;i++){
      total+=items[i].price;
    }
  }
  final List<cartItem> items=[
    cartItem(Product(
      name: "MI Tv",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a Mi TV",
      price: 5500,
    ),1,5500),
    cartItem(Product(
      name: "LG TV",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a LG TV",
      price: 5500,
    ),1,5600)    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
              child: Container(
                height: 50,
          color: Colors.deepPurpleAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Checkout"),
            ],
          ),
        ),
      ),
      appBar: AppBar(title: Text("Cart"),),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.05,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Center(child: Text('Total cart value: $total')),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.75,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i){
                return CartItem(items[i],removeProduct,changeQuantity,i);
              }),
          ),
        ],
      ),
      
    );
  }
}