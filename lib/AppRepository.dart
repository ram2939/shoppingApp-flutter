
import 'package:http/http.dart' as http;
import 'package:shopping_app/models/product.dart';
class AppRepository{
  final url='http://192.168.31.242:3000';
getLogin() async{
var response = await http.post("$url/login", body: {'userName': 'Ram', 'Password': 'red'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');
}
Future<dynamic> fetchProduct(String id) async{
  var response=await http.get("$url/product/$id");
  print('Response staus: ${response.statusCode}');
  print(response.body.runtimeType);
  return response;
  }
}