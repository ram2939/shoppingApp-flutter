
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/cartItem.dart';
import 'models/user.dart';
class AppRepository{
  List<cartItem> cart;
  User loggedInUser;
  final url='http://192.168.31.242:3000';

getLogin(String email, String password) async{
var response = await http.post("$url/user/login", body: {'email': email, 'password': password});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
if(response.statusCode==200)
{
  final jsonUser=jsonDecode(response.body);
  loggedInUser=User.fromJSON(jsonUser);
  getCartItems(loggedInUser.userID);
}
return response.statusCode;
}
Future<dynamic> fetchProduct(String query) async{
  var q={
    'query':query
  };
  var response=await http.post("$url/product",
    body:q
  );
  print('Response staus: ${response.statusCode}');
  print(response.body.runtimeType);
  print(response.body);
  return response;
  }
Future<dynamic> fetchReviews(String id) async{
  var response=await http.get("$url/reviews/$id");
  print('Response staus: ${response.statusCode}');
  print(response.body.runtimeType);
  return response;
  }
getCartItems(String uid) async{
  print(uid);
 var response=await http.post("$url/user/cart",body: {
   'uid':uid
 });
//  print(response.body);
  final jsonCart=jsonDecode(response.body) as List;
  cart=jsonCart.map((value){
    return cartItem.fromJSON(value);
  }).toList();
  print(cart[0].item.name);
}
}