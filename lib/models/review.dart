class Review {
  // final String productID;
  final String userName;
  final String heading;
  final String review;
  final String ratings;
  final List<dynamic> images=["https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70"];
  final String date;

  Review(
    {
      // this.productID,
      this.heading,
      this.userName,
      // this.images,
      this.ratings,
      this.review,
      this.date
    }
  );
  static Review fromJson(Map<String,dynamic> json){
      return Review(
        userName: json['userName'],
        date: json['date'],
        heading: json['heading'],
        // productID: json['productID'],
        ratings: json['rating'],
        review:json['review'],
        // images: json['images']
      );
  }
}