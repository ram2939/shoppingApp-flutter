import 'package:flutter/material.dart';
import 'package:shopping_app/utils/sizeConfig.dart';
class ProductDescription extends StatelessWidget {
  final List<String> details=["1st line","2nd line","3rd line","4th line","1st line","2nd line","3rd line","4th line","1st line","2nd line","3rd line","4th line","1st line","2nd line","3rd line","4th line",];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.only(right:5),
      height: SizeConfig.safeBlockVertical*20,
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