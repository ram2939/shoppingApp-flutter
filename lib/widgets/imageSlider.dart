// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:simple_slider/simple_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
class ImageSlider extends StatefulWidget {
  final List<String> list;
  ImageSlider(this.list);
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> array=["https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70","https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70","https://rukminim1.flixcart.com/image/416/416/k0sgl8w0/television/r/q/g/mi-l43m4-4ain-original-imafkdzpsafcrzue.jpeg?q=70"];
  @override
  Widget build(BuildContext context) {
    return
            SizedBox(
  height: MediaQuery.of(context).size.height*0.3,
  width: MediaQuery.of(context).size.width,
  child: Carousel(
    dotBgColor: Colors.black12,
    autoplay:false,
    images: widget.list.map((value){
      return 
      Padding(
        padding: EdgeInsets.all(5),
     child:Image(
       image: NetworkImage(value)));
    }).toList()
  )
);
    // ImageSliderWidget(imageUrls: array, imageBorderRadius: BorderRadius.circular(8.0));
    
    // Container(
    //   color: Colors.white70,
    //   child: Column(
    //     children: [
    //       CarouselSlider.builder(
    //         initialPage: 0,
    //         enableInfiniteScroll: false,
    //         itemCount: array.length, itemBuilder: (context,index){
    //         return Padding(
    //           padding: const EdgeInsets.all(2.0),
    //           child: Image(image: NetworkImage(array[index])),
    //         );
    //       },
    //         onPageChanged: (index) {
    //           setState(() {
    //             _current = index;
    //           });
    //         },
    //       ),
    //       // Positioned(
    //       //   top: 0.0,
    //       //   left: 0.0,
    //       //   right: 0.0,
    //       //   child: 
    //         Container(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             // scrollDirection: Axis.horizontal,
    //             // itemCount: array.length,
    //             // mainAxisAlignment: MainAxisAlignment.center,
    //             children: array.map((value) {
    //               return Container(
    //                 width: 8.0,
    //                 height: 8.0,
    //                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
    //                 decoration: BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: _current == array.indexOf(value) ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
    //                 )
    //               );
    //             }
    //             ).toList(),
    //               )
    //             // )
    //           )
    //     ]
    //       ),
    // );
  }
}



// CarouselSlider.builder(
//           enableInfiniteScroll: false,
//           )