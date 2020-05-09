import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/products_screen.dart';
import 'package:shopping_app/Screens/searchScreen.dart';
import 'package:shopping_app/utils/navigation.dart';
import 'package:shopping_app/utils/sizeConfig.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _textEditingController=new TextEditingController();
  final bool active;
  SearchBar({
    // this.onPressed,this.onTap,
    this.active=false});
  String getSearch(){
    return _textEditingController.text;
  }
  @override
  Widget build(BuildContext context) {
  SizeConfig().init(context);
  Function onPressed=(){
                Navigator.of(context).pop();
                Navigate.push(context, ProductsScreen(_textEditingController.text),plain: true);
              };
  Function onTap=(){
    Navigate.push(context, SearchScreen(),plain: true);
  };
    return Container(
      height: SizeConfig.safeBlockVertical*8,
      margin: EdgeInsets.all(8),
      width: SizeConfig.safeBlockHorizontal*99,
      child: Card(
        elevation: 10,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed:active? onPressed:(){},
              color: Theme.of(context).primaryColor,
            ),
            active
            ? Container(
              width: SizeConfig.safeBlockHorizontal*80,
              child: TextField(
                autofocus: true,
                onSubmitted: (_){
                  onPressed();
                },
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search"
                ),
              )
              )
              : Container(
                  width: SizeConfig.safeBlockHorizontal*80,
                child: GestureDetector(
                onTap: onTap,
                child: Text("Search",
                style: TextStyle(
                  color: Colors.grey
                )
                ,))
            )
          ],
        ),
      ),
    );
  }
}