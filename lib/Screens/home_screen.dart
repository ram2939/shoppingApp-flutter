import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/utils/sizeConfig.dart';

import '../models/product.dart';
import '../widgets/drawer.dart';
import '../widgets/horizontalListView.dart';
import '../widgets/searchBar.dart';

class HomeScreen extends StatelessWidget {
  final AppBar _appbar = AppBar(
    title: Text("Welcome to ShopAIO"),
  );
  // SearchBar searchBar;
    final searchBar = SearchBar(
      active: false,
    );
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Product> items = [
      Product(
          id: "bvkbkfbk",
          name: "MI Tv",
          image:
              "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
          description: "This is a Mi TV",
          price: 25000,
          ratings: 4.4,
          sellerID: "asbfcksd",
          sellerName: "Enterprises"),
      Product(
          id: "sdknvk",
          name: "LG TV",
          image:
              "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
          description: "This is a LG TV",
          price: 44000,
          ratings: 4.2,
          sellerID: "asbfcksd",
          sellerName: "Enterprises"),
      Product(
          id: "mbsdfjbsdv",
          name: "LG TV",
          image:
              "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",
          description: "This is a LG TV",
          price: 44000,
          ratings: 4.2,
          sellerID: "asbfcksd",
          sellerName: "Enterprises"
          ),
    ];
    print(SizeConfig.safeBlockVertical);
    return Scaffold(
      appBar: _appbar,
      drawer: AppDrawer(),
      body: SafeArea(
              child: Column(
          children: <Widget>[
            searchBar,
            Container(
              height: SizeConfig.safeBlockVertical*89.4,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // categoryRow("Featured Products"),
                  // HorizontalList(items),
                  featuredItems(context),
                  topItems(context),
                  // categoryRow("Top Choices"),
                  // HorizontalList(items),
                  recentItems(context),
                  // catergoryRow("Recently Added"),
                  // HorizontalList(items),
                  categoryRow("Mobiles"),
                  // HorizontalList(items),
                  categoryRow("Laptops"),
                  // HorizontalList(items),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryRow(String text) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text),
            FlatButton(
              child:
                  Text("SEE ALL", style: TextStyle(color: Colors.blueAccent)),
              onPressed: () {},
            )
          ],
        ),
      );
    }

Widget recentItems(BuildContext context){
  return FutureBuilder(
    future: Provider.of<AppRepository>(context).getRecent(),
    builder: (context,snapshot){
      if(snapshot.hasData&&snapshot.data.length>0){
        return Column(
          children: <Widget>[
            categoryRow("Recent"),
            HorizontalList(snapshot.data)
          ],
        );
      }
      else return Container();
    });
}
Widget topItems(BuildContext context){
  return FutureBuilder(
    future: Provider.of<AppRepository>(context).getTop(1),
    builder: (context,snapshot){
      if(snapshot.hasData&&snapshot.data.length>0){
        return Column(
          children: <Widget>[
            categoryRow("Top Choices"),
            HorizontalList(snapshot.data)
          ],
        );
      }
      else return Container();
    });
}
Widget featuredItems(BuildContext context){
  return FutureBuilder(
    future: Provider.of<AppRepository>(context).getFeatured(1),
    builder: (context,snapshot){
      if(snapshot.hasData&&snapshot.data.length>0){
        return Column(
          children: <Widget>[
            categoryRow("Featured"),
            HorizontalList(snapshot.data)
          ],
        );
      }
      else return Container();
    });
}