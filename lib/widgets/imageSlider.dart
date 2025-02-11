// import 'package:carousel_slider/carousel_slider.dart';
// import 'dart:math';
// import 'package:photo_view/photo_view.dart';
import 'package:shopping_app/utils/sizeConfig.dart';

import '../Screens/ViewImage.dart';
import 'package:flutter/material.dart';
// import 'package:simple_slider/simple_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageSlider extends StatelessWidget {
  final List<String> list;
  ImageSlider(this.list);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
  Container(
  height: SizeConfig.safeBlockVertical*38,
  width: SizeConfig.safeBlockHorizontal*80,
  child: Carousel(
    dotSize: 7,
    dotSpacing: 20,
    // dotVerticalPadding: -5,
    dotBgColor: Colors.black12,
    autoplay:false,
    images: list.map((value){
        var image=Image(
         image: NetworkImage(value));
        var tag=value;
      return 
      Padding(
        padding: EdgeInsets.symmetric(horizontal:5),
     child:Hero(
            tag: tag,
            child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewImage(image,tag)));
                        },
                          child: image,
            ),
     ));
    }).toList()
  )
);
    
  }
}