class Review {
  final String productID;
  final String heading;
  final String review;
  final String ratings;
  final List<dynamic> images;
  final String date;

  Review(
    {
      this.productID,
      this.heading,
      this.images,
      this.ratings,
      this.review,
      this.date
    }
  );
  static Review fromJson(Map<String,dynamic> json){
      return Review(
        date: json['date'],
        heading: json['heading'],
        // productID: json['productID'],
        ratings: json['ratings'],
        // review:json['review'],
        images: json['images']
      );
  }
}