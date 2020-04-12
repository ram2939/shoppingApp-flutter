class Review {
  final String productID;
  final String heading;
  final String review;
  final int ratings;
  final List<String> images;
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
}