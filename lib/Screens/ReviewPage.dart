import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
// import 'package:shopping_app/models/product.dart';
// import 'package:shopping_app/models/review.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/reviewItem.dart';

class ReviewPage extends StatelessWidget {
  final String id;
  ReviewPage(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Reviews"),
      // ),
      body: FutureBuilder(
        future:
            Provider.of<AppRepository>(context, listen: false).fetchReviews(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.length > 0
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return ReviewItem(snapshot.data[i]);
                    })
                : Center(child: Text("No reviews yet......"));
          } else
            return (Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
