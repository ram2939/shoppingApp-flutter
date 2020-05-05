import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/widgets/drawer.dart';
import 'package:shopping_app/widgets/productListItem.dart';
import 'package:shopping_app/widgets/searchBar.dart';

import '../models/product.dart';
// import '../widgets/productGriditem.dart';

class ProductsScreen extends StatelessWidget {
  final String searchText;
  // final List<Product> list;
  final AppRepository y = AppRepository();
//   @override
//   _ProductsScreenState createState() => _ProductsScreenState();
// }

// class _ProductsScreenState extends State<ProductsScreen> {
  // List<Product> items;
  ProductsScreen(this.searchText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results for $searchText"),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          SearchBar(),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: FutureBuilder(
                future: search(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ProductListItem(snapshot.data[index]);
                      },
                    );
                  } else
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                }),
          ),
        ],
      ),
    );
  }

  Future<List<Product>> search() async {
    var response = await y.fetchProduct(searchText);
    final parsed = (jsonDecode(response.body)) as List;
    print(parsed);
    List<Product> list = parsed.map((value) {
      //value['_source']['_id'] = value['_id'];
      // return Product.fromJSON(value['_source']);
      return Product.fromJSON(value);
    }).toList();
    // list.add(Product.fromJSON(parsed));
    return list;
  }
}
