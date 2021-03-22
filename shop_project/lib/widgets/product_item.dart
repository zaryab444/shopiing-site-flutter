import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_project/providers/cart.dart';
import 'package:shop_project/providers/product.dart';
import '../screens/product_detail_screen.dart';
import '../providers/cart.dart';
import '../providers/products.dart';

class ProductItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
   final product = Provider.of<Product>(context);
   final cart = Provider.of<Cart>(context, listen: false);


    return ClipRRect(

      //ClipRect help clipping rectangle round corner
      borderRadius: BorderRadius.circular(10),

      child: GridTile(

        //Grid tile is use as header card for display image

        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id ,
            );
          },
          child: Image.network(
           product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),

        footer: GridTileBar(
          //gridtile is a textbar of product name
          backgroundColor: Colors.black54,
          leading: IconButton(
            // leading make the icon left
            icon: Icon(product.isFavorite ? Icons.favorite: Icons.favorite_border,),
            color: Theme.of(context).accentColor,

            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),

          trailing: IconButton(
            //trailing make the icon right
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
