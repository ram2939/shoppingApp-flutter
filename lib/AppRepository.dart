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

  addToCart(Product item,ProductSeller seller) async {
    await http.put("$url/user/addToCart", body: {
      'uid': loggedInUser.userID,
      'pid': item.id,
      'price': item.price.toString(),
      'sid':seller.id,
      'name':seller.name,
    });
    getCartItems(loggedInUser.userID);
  }

  addToFavorite(Product item) async {
    await http.put("$url/user/addToFavorite", body: {
      'uid': loggedInUser.userID,
      'pid': item.id,
      // 'price':item.price.toString()
    });
    getFavoriteItems(loggedInUser.userID);
  }

  Future<dynamic> fetchProduct(String query) async {
    var q = {'query': query};
    var response = await http.post("$url/product", body: q);
    print('Response staus: ${response.statusCode}');
    print(response.body.runtimeType);
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
    final jsonReview = jsonDecode(response.body) as List;
    return jsonReview.map((value) {
      return Review.fromJson(value);
    }).toList();
  }

  getCartItems(String uid) async {
    print(uid);
    var response = await http.post("$url/user/cart", body: {'uid': uid});
    print(response.body);
    final jsonCart = jsonDecode(response.body) as List;
    cart = jsonCart.map((value) {
      return cartItem.fromJSON(value);
    }).toList();
    print(cart[0].item.name);
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
    var response = await http
        .post("$url/user/login", body: {'email': email, 'password': password});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final jsonUser = jsonDecode(response.body);
      loggedInUser = User.fromJSON(jsonUser);
      // getCartItems(loggedInUser.userID);
      // getFavoriteItems(loggedInUser.userID);
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
