import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/Screens/home_screen.dart';
import 'package:shopping_app/utils/navigation.dart';
import 'package:shopping_app/utils/sizeConfig.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: SizeConfig.blockSizeVertical * 10,
                  width: SizeConfig.blockSizeHorizontal * 50,
                  child: FittedBox(
                    child: Text(
                      "ShopAIO",
                      // style: TextStyle(fontSize: 50),
                    ),
                  ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      // focusedBorder:OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(50),
                      //       borderSide: BorderSide(
                      //           color: Colors.red)) ,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      prefixIcon: Icon(Icons.vpn_key),
                      hintText: "Enter the Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor)
                              )
                              ),
                  obscureText: true,
                ),
              ),
              FlatButton(
                  onPressed: () async {
                    var response =
                        await Provider.of<AppRepository>(context, listen: false)
                            .getLogin(email.text, password.text) as int;
                    if (response == 200)
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (r) => false);
                    else if (response == 400)
                      Fluttertoast.showToast(msg: "Password Incorrect");
                    else
                      Fluttertoast.showToast(msg: "No User Found");
                  },
                  color: Colors.blueAccent,
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
