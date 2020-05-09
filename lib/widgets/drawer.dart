import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/Screens/favorites.dart';
import '../Screens/cart.dart';
import '../Screens/loginPage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  // height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      shape: BoxShape.circle),
                  child: 
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(Provider.of<AppRepository>(context).loggedInUser.profile),
                    )
        //             CachedNetworkImage(
        //                 imageBuilder: (context,imageProvider){
        //                   return Container(
        //                     decoration: BoxDecoration(
        //                       image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
        //               border: Border.all(color: Colors.black12, width: 2),
        //               shape: BoxShape.circle
        //               ),
        //                   );
        //                 },
        //                 imageUrl: Provider.of<AppRepository>(context).loggedInUser.profile,
        //                 placeholder: (context, url) => CircularProgressIndicator(),
        // errorWidget: (context, url, error) => Icon(Icons.error),)
        //           // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      Provider.of<AppRepository>(context).loggedInUser.name, style: TextStyle(fontWeight: FontWeight.bold),),
                      
                ),
              ],
            ),
            Divider(thickness: 0.5),
            GestureDetector(
              child: ListTile(leading: Icon(Icons.home), title: Text("Home")),
              onTap: () {
                // Navigator.of(context).popUntil(ModalRoute.withName('/'));
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', ModalRoute.withName('/'));
              },
            ),
            GestureDetector(
              child: ListTile(
                  leading: Icon(Icons.shopping_cart), title: Text("Cart")),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
            GestureDetector(
              child: ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text("Favorites")),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Favorites()));
              },
            ),
            Divider(
              thickness: 0.5,
            ),
            GestureDetector(
              child: ListTile(title: Text("Logout")),
              onTap: () {
                // Navigator.popUntil(context, ModalRoute.withName("/"));
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => LoginPage()),(r)=>false);
              },
            )
          ]),
        ),
      ),
    );
  }
}
