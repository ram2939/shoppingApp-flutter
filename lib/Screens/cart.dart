import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/product.dart';
import '../widgets/cartItem.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  removeProduct(Product item){
      setState(() {
      items.remove(item);  
      });
      Fluttertoast.cancel();
      Fluttertoast.showToast(msg: "${item.name} removed from cart");
      print("Hello");
      
  }

  final List<Product> items=[
    Product(
      name: "MI Tv",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a Mi TV",
      price: 5500,
    ),
    Product(
      name: "LG TV",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a LG TV",
      price: 5500,
    ),
    Product(
      name: "LG TV",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a LG TV",
      price: 5500,
    ),
    Product(
      name: "LG TV",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a LG TV",
      price: 5500,
    ),
    Product(
      name: "LG TV",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a LG TV",
      price: 5500,
    ),
    Product(
      name: "LG TV",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a LG TV",
      price: 5500,
    ),
    Product(
      name: "LG TV",
      image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
      description: "This is a LG TV",
      price: 5500,
    ),
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
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i){
          return CartItem(items[i],removeProduct);
        }),
      
    );
  }
}