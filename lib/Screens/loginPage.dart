import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/Screens/home_screen.dart';
import 'package:shopping_app/utils/navigation.dart';

class LoginPage extends StatelessWidget {
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: email,
            decoration: InputDecoration(
              hintText: "Enter the email"
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              hintText: "Enter the Password"
            ),
            obscureText: true,
          ),
          FlatButton(onPressed: () async{
          print(await Provider.of<AppRepository>(context,listen: false).getLogin(email.text, password.text));
          Navigate.push(context, HomeScreen(),plain: true); 
          }, child: Text("Login"))
        ],
      ),
      
    );
  }
}