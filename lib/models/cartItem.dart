import 'product.dart';
class cartItem {
  final Product item;
  int itemQuantity;
  final int price;
  final String sellerID;
  final String sellerName;

  cartItem({this.item,this.itemQuantity,this.price,this.sellerID,this.sellerName});
  // static cartItem fromJSON(Map<String,dynamic> json)
  // {
  //   var i=Product.fromJSON(json);
  //   var q=int.parse(json['quantity']);
  //   return cartItem(i,q,i.price);
  // }
  Product get product{
    return item;
  }
  int get quantity{
    return itemQuantity;
  }
  set quantity(int qty){
    itemQuantity=qty;
  }
  static cartItem fromJSON(Map<String,dynamic> json){
    return cartItem(item: Product.fromJSON(json['product']),itemQuantity:1,price: int.parse(json['price']),sellerID: json['seller'],sellerName: json['sellerName']);   
  }
}