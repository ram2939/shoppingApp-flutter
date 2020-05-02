class ProductSeller{
  final String name;
  final String id;
  final int price;

ProductSeller({this.name,this.id,this.price});
static ProductSeller fromJSON(Map<String,dynamic> json){
  return ProductSeller(id: json['seller'],name:json['name'],price: (json['price']));
}
}