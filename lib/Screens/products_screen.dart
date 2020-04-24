import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_app/AppRepository.dart';
// import 'package:shopping_app/Screens/searchScreen.dart';
// import 'package:shopping_app/utils/navigation.dart';
import 'package:shopping_app/widgets/productListItem.dart';
import 'package:shopping_app/widgets/searchBar.dart';
import '../models/product.dart';
// import '../widgets/productGriditem.dart';

class ProductsScreen extends StatelessWidget {
  final String searchText;
  // final List<Product> list;
  ProductsScreen(this.searchText);
//   @override
//   _ProductsScreenState createState() => _ProductsScreenState();
// }

// class _ProductsScreenState extends State<ProductsScreen> {
  // List<Product> items;
  final AppRepository y = AppRepository();

  // List<Product> items=[
  //   Product(
  //     name: "MI Tv",
  //     image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
  //     description: "This is a Mi TV",
  //     price: 25000,
  //     ratings: 4.4,
  //     isFavorite: false
  //   ),
  //   Product(
  //     name: "LG TV",
  //     image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
  //     description: "This is a LG TV",
  //     price: 44000,
  //     ratings: 4.2,
  //     isFavorite: true
  //   ),
  // ];
  SearchBar sb;
  Future<List<Product>> search() async {
    var response = await y.fetchProduct(searchText);
    final parsed = (jsonDecode(response.body)) as List;
    print(parsed);
    List<Product> list = parsed.map((value) {
      return Product.fromJSON(value['_source']);
    }).toList();
    // list.add(Product.fromJSON(parsed));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    sb=SearchBar(
            // onTap: (){
            //       Navigate.push(context, SearchScreen(),plain: true);
            //     },
            // onPressed: (){
            //   Navigate.push(context, ProductsScreen(sb.getSearch()),plain: true);
            // },
            active: false,
          );
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results for $searchText"),
      ),
      body: Column(
        children: <Widget>[
          sb,
          Container(
            height: MediaQuery.of(context).size.height*0.8,
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
                    return Container(child: Center(child: CircularProgressIndicator()),);
                }),
          ),
        ],
      ),
    );
  }
}
