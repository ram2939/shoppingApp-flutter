import 'dart:convert';
// import 'package:loadmore/loadmore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/utils/sizeConfig.dart';
import 'package:shopping_app/widgets/drawer.dart';
import 'package:shopping_app/widgets/productListItem.dart';
import 'package:shopping_app/widgets/searchBar.dart';

import '../models/product.dart';
// import '../widgets/productGriditem.dart';

// class ProductsScreen extends StatefulWidget {
//   final String searchText;
//   final List<Product> list=[];

//   ProductsScreen(this.searchText);

//   @override
//   _ProductsScreenState createState() => _ProductsScreenState();
// }

// class _ProductsScreenState extends State<ProductsScreen> {
//   final AppRepository y = AppRepository();
//   int page=1;
//   @override
//   void initState(){
//     super.initState();
//     search();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search Results for ${widget.searchText}"),
//       ),
//       drawer: AppDrawer(),
//       body: Column(
//         children: <Widget>[
//           SearchBar(),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.8,
//             // child: FutureBuilder(
//             //     future: search(),
//             //     builder: (context, snapshot) {
//             //       if (snapshot.hasData) {
//                     child: LoadMore(
//                         // isFinish: widget.list.length>=2,
//                         onLoadMore: search,
//                         child: ListView.builder(
//                         itemCount: widget.list.length,
//                         itemBuilder: (context, index) {
//                           return ProductListItem(widget.list[index]);
//                         },
//                         ),
//                     )
//                       )
//         ]
//       )

//                     // );
//       //             } else
//       //               return Container(
//       //                 child: Center(child: CircularProgressIndicator()),
//       //               );
//       //           }),
//       //     ),
//       //   ],
//       // ),
//     );
//   }

//   Future<bool> search() async {
//     var response = await y.fetchProduct(widget.searchText,page);
//     final parsed = (jsonDecode(response.body)) as List;
//     print("Search:");
//     print(parsed);
        
//     parsed.map((value) {
//       //value['_source']['_id'] = value['_id'];
//       widget.list.add(Product.fromJSON(value));
//       // return Product.fromJSON(value);
      
//     });
//     page++;
//     // list.add(Product.fromJSON(parsed));
//     // return widget.list;
//     return true;
//   }
// }

class ProductsScreen extends StatefulWidget {
  final String query;
  ProductsScreen(this.query);
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int pageNum = 1;
  bool isPageLoading = false;
  List<Product> arrayOfProducts;
  ScrollController controller;
  Future<List<Product>> future;
  int totalRecord = 0;

  @override
  void initState() {
    controller = new ScrollController()..addListener(_scrollListener);
    future = _callAPIToGetListOfData();
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final constListView = ListView.builder(
        itemCount: arrayOfProducts == null ? 0 : arrayOfProducts.length,
        controller: controller,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ProductListItem(arrayOfProducts[index]),
              Container(
                color: Colors.black12,
                height: (index == arrayOfProducts.length-1 && totalRecord > arrayOfProducts.length) ? 50 : 0,
                width: MediaQuery.of(context).size.width,
                child:Center(
                  child: CircularProgressIndicator()
                ),
              )
            ],
          );
        });
    return Scaffold(
        appBar: AppBar(
          title: Text("Search Results for ${widget.query}"),
          centerTitle: true,
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            SearchBar(active:false),
            Container(
              height: SizeConfig.safeBlockVertical*89.4,
              child: FutureBuilder<List<Product>>(
                  future: future,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          Text(
                              'YOu have some error : ${snapshot.hasError.toString()}');
                        } else if (snapshot.data != null) {
                          if(snapshot.data.length>0)
                          {isPageLoading = false;
                          print(arrayOfProducts);
                          return constListView;
                          }
                          else return Center(child: Text("No products found"));
                        }
                    }
                  }),
            ),
          ],
        ));
  }

  Future<List<Product>> _callAPIToGetListOfData() async {
    isPageLoading = true;
    final responseDic =await Provider.of<AppRepository>(context,listen: false).fetchProduct(widget.query, pageNum);
    final parsed = json.decode(responseDic.body) as List;
    List<Product> temArr =parsed.map((value){
      return Product.fromJSON(value);
    }).toList();
    setState(() {
      // totalRecord+=temArr.length;
      if (pageNum == 1) {
        arrayOfProducts = temArr;
      } else {
        arrayOfProducts.addAll(temArr);
      }
      pageNum++;
    });
    return arrayOfProducts;
  }

  _scrollListener() {
    if (totalRecord == arrayOfProducts.length) {
      return;
    }
    print(controller.position.extentAfter);
    if (controller.position.extentAfter <= 0 && isPageLoading == false) {
      Future.delayed(Duration(seconds: 1)).then((_){_callAPIToGetListOfData();});     
    }
  }
}