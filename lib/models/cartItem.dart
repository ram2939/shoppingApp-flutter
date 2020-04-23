import 'product.dart';
class cartItem {
  final Product item;
  int itemQuantity;
  double price;

  cartItem(this.item,this.itemQuantity,this.price);
  static cartItem fromJSON(Map<String,dynamic> json)
  {
    var i=Product.fromJSON(json);
    var q=int.parse(json['quantity']);
    return cartItem(i,q,i.price);
  }
  Product get product{
    return item;
  }
  int get quantity{
    return itemQuantity;
  }
  void set quantity(int qty){
    itemQuantity=qty;
  }
}