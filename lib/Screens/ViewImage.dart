import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class ViewImage extends StatelessWidget {
  Image image;
  String tag;
  ViewImage(this.image,this.tag);
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Center(
        child: Hero(
          tag: tag,
          child:PhotoView(
            minScale: 1.0,
            initialScale:1.0 ,
            imageProvider: image.image)
        ),
      ),
    );
  }
}