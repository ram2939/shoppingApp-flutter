
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product.dart';
class AppRepository{
  List<Product> cart;
  String userEmail;
  final url='http://192.168.31.242:3000';
getLogin(String email, String password) async{
var response = await http.post("$url/user/login", body: {'email': email, 'password': password});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
return jsonDecode(response.body);
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
}