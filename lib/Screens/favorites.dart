import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/AppRepository.dart';
import 'package:shopping_app/Screens/productPage.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/utils/navigation.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Product> favorites;
  removeItem(Product item){
    setState(() {
    favorites.remove(item);
    Provider.of<AppRepository>(context,listen: false).removeFromFavorite(item.id);  
    });
  }
  @override
  void initState(){
    super.initState();
    favorites=Provider.of<AppRepository>(context,listen: false).favorites;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body:favorites.length>0
       ?ListView.builder(itemCount: favorites.length,
        itemBuilder: (context,i){
          return FavoriteListItem(favorites[i],removeItem);
        })
        :Container(child: Center(child: Text("No items in Favorites"),),)
    );
  }
}
class FavoriteListItem extends StatelessWidget {
  final Product item;
  final Function removeCallback;
FavoriteListItem(this.item,this.removeCallback);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: <Widget>[
          ListTile(
            // alignment: AlignmentDirectional.bottomCenter,
                onTap: (){
                  Navigate.push(context, ProductPage(item));
                },
                leading: Image(

                    // height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.5,
                    image: NetworkImage(item.image)),
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(item.name,
                      overflow: TextOverflow.ellipsis,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ratingBar(item.ratings),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: <Widget>[
                          Text("₹ "),
                          Text(item.price.toString(),
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 25
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  removeCallback(item);
                  Provider.of<AppRepository>(context,listen: false).removeFromFavorite(item.id);
                },
              ),
          ),
          Divider(thickness:1,)
        ],
      ),
    );
  }
  Widget ratingBar(double rating)
  {
    return RatingBar(
      ignoreGestures: true,
      itemSize: 20,
   initialRating: rating,
   maxRating: rating,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemBuilder: (context, _) => Container(
    //  margin: EdgeInsets.symmetric(horizontal: -5),
     child: Icon(
       Icons.star,
       color: Colors.amber,
     ),
   ),
   onRatingUpdate: (rating) {
     print(rating);
   },
);
  }
}