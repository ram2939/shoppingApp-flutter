class Product{
  final String name;
  final String image;
  final String description;
  final double price;
  final double ratings;
  final bool isFavorite;
  Product(
    {
      this.name,
      this.description,
      this.image,
      this.price,
      this.ratings,
      this.isFavorite
    }
  );

  static Product fromJSON(Map<String,dynamic> json){
    Product product=Product(name:json['name'],description: json['description'],image: "https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70",price: 55000,isFavorite: false);
    print(product.name);
    return product;

  }

}