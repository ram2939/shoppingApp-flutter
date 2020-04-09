import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function onPressed;
  final TextEditingController _textEditingController=new TextEditingController();
  SearchBar({this.onPressed});
  String getSearch(){
    return _textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width*0.99,
      child: Card(
        elevation: 10,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: onPressed,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search"
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}