import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/ProductDetails.dart';
import 'package:shopping_app/Screens/ReviewPage.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/widgets/drawer.dart';
// import 'package:shopping_app/models/review.dart';

class ProductPage extends StatefulWidget {
  final Product item;
  ProductPage(this.item);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Widget> _children = [];
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _children = [ProductDetails(widget.item), ReviewPage(widget.item.id)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(widget.item.name),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            title: Text('Reviews'),
          ),
        ],
      ),
    );
  }
}
