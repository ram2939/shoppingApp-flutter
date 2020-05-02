import 'package:flutter/material.dart';
class ProductDescription extends StatelessWidget {
  final List<String> details=["1st line","2nd line","3rd line","4th line","1st line","2nd line","3rd line","4th line","1st line","2nd line","3rd line","4th line","1st line","2nd line","3rd line","4th line",];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right:5),
      height: MediaQuery.of(context).size.height*0.2,
      color: Colors.black38,
      child: Scrollbar(
              child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: details.map((value){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("• "+value),
              );
          }
          ).toList()
        ),
      ),
      
    );
  }
}