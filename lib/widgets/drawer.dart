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
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 2),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        "https://cdn.signmyemails.com/images/avatar.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      Provider.of<AppRepository>(context).loggedInUser.name),
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
