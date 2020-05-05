import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/Screens/home_screen.dart';
import 'package:shopping_app/utils/navigation.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Text(
                "ShopAIO",
                style: TextStyle(fontSize: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      hintText: "Enter the email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor)))),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     controller: password,
            //     decoration: InputDecoration(
            //       prefix: Icon(Icons.vpn_key),
            //       hintText: "Enter the Password",
            //       border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(50),
            //               borderSide: BorderSide(
            //                   color: Theme.of(context).accentColor)
            //                   ),),
            //     obscureText: true,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    disabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor)) ,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Enter the Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor))),
                              obscureText: true,

                              ),
            ),
            FlatButton(
                onPressed: () async {
                  print(await Provider.of<AppRepository>(context, listen: false)
                      .getLogin(email.text, password.text));
                  Navigator.pushNamedAndRemoveUntil(context,'/home',(r)=>false);
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
