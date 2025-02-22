import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/productSeller.dart';

import 'models/cartItem.dart';
import 'models/review.dart';
import 'models/user.dart';

class AppRepository {
  List<cartItem> cart;
  User loggedInUser;
  List<Product> favorites;
  List<Review> reviews;
  final url = 'http://192.168.31.242:3000';
  // final url = 'http://13.233.138.244:3000';

  addToCart(Product item) async {
    await http.put("$url/user/addToCart", body: {
      'uid': loggedInUser.userID,
      'pid': item.id,
      'price': item.price.toString(),
      'sid':item.sellerID,
      'name':item.sellerName,
    });
    cartItem newItem=new cartItem(item: item,itemQuantity: 1,price: item.price,sellerID:item.sellerID,sellerName: item.sellerName);
    cart.add(newItem);
    // Future.delayed(Duration(seconds: 2)).then((_){
    //   getCartItems(loggedInUser.userID);
    // });
    
  }
  getSellerProducts(String id) async{
    var response=await http.post("$url/seller/getProducts",body: {
      'sid':id
    });
    print(response.statusCode);
    if(response.statusCode!=400){
    final parsed=jsonDecode(response.body) as List;
    List<Product> x=parsed.map((f){
      return Product.fromJSON(f['product']);
    }).toList();
    return x;
    }
    else return -1;
  }
  addToFavorite(Product item) async {
    await http.put("$url/user/addToFavorite", body: {
      'uid': loggedInUser.userID,
      'pid': item.id,
      // 'price':item.price.toString()
    });
    getFavoriteItems(loggedInUser.userID);
  }

  Future<dynamic> fetchProduct(String query,int page) async {
    var q = {'query': query,
              'page':page.toString()};
    var response = await http.post("$url/product", body: q);
    print('Response staus: ${response.statusCode}');
    print(response.body.runtimeType);
    print("Products");
    print(response.body);
    return response;
  }
  getSellers(String pid) async{
    var response=await http.post("$url/product/getSellers",body: { 'pid':pid});
    print("Response status: ${response.statusCode}");
    final jsonSellers=jsonDecode(response.body) as List;
    return jsonSellers.map((f){
      return ProductSeller.fromJSON(f);
    }).toList();
  }

  fetchReviews(String id) async {
    var response = await http.post("$url/reviews/", body: {'pid': id});
    print('Response staus: ${response.statusCode}');
    print(response.body.runtimeType);
    print(response.body);
    if(response.statusCode!=400){
    final jsonReview = jsonDecode(response.body) as List;
    return jsonReview.map((value) {
      return Review.fromJson(value);
    }).toList();
    }
    else return [];
  }

  getCartItems(String uid) async {
    print(uid);
    var response = await http.post("$url/user/cart", body: {'uid': uid});
    print(response.body);
    final jsonCart = jsonDecode(response.body) as List;
    cart = jsonCart.map((value) {
      return cartItem.fromJSON(value);
    }).toList();
    // print(cart[0].item.name);
  }
  getFeatured(int page) async {
    // print(uid);
    var response = await http.post("$url/product/featured", body: {'page': page.toString()});
    print(response.body);
    final jsonCart = jsonDecode(response.body) as List;
    return jsonCart.map((value) {
      return Product.fromJSON(value['product']);
    }).toList();
    // print(cart[0].item.name);
  }
  getTop(int page) async {
    // print(uid);
    var response = await http.post("$url/product/top", body: {'page': page.toString()});
    print(response.body);
    final jsonCart = jsonDecode(response.body) as List;
    return jsonCart.map((value) {
      return Product.fromJSON(value['product']);
    }).toList();
    // print(cart[0].item.name);
  }
  getRecent() async {
    // print(uid);
    var response = await http.get("$url/product/recent");
    print(response.body);
    final jsonCart = jsonDecode(response.body) as List;
    return jsonCart.map((value) {
      return Product.fromJSON(value);
    }).toList();
    // print(cart[0].item.name);
  }
  

  getFavoriteItems(String uid) async {
    print(uid);
    var response = await http.post("$url/user/favorites", body: {'uid': uid});
    final jsonFavorites = jsonDecode(response.body) as List;
    favorites = jsonFavorites.map((value) {
      return Product.fromJSON(value['product']);
    }).toList();
  }

  getLogin(String email, String password) async {
    var response = await http.post("$url/user/login", body: {'email': email, 'password': password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final jsonUser = jsonDecode(response.body);
      loggedInUser = User.fromJSON(jsonUser);
      getCartItems(loggedInUser.userID);
      getFavoriteItems(loggedInUser.userID);
    }
    return response.statusCode;
  }

  removeFromCart(String pid) async {
    print(pid);
    cart.removeWhere((value) => value.item.id == pid);
    await http.put("$url/user/removeFromCart",
        body: {'uid': loggedInUser.userID, 'pid': pid});
  }

  removeFromFavorite(String pid) async {
    favorites.removeWhere((item) => item.id == pid);
    print(pid);
    await http.put("$url/user/removeFromFavorite",
        body: {'uid': loggedInUser.userID, 'pid': pid});
  }
}
