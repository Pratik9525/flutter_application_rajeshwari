// // ignore: file_names
// // ignore: file_names
// // ignore: file_names
// // ignore: file_names
// // ignore: file_names

// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// // import 'package:flutter_provider_shop/Providers/cart_provider/cart_provider.dart';
// // import 'package:flutter_provider_shop/Providers/product_provider/product.dart';
// // import 'package:flutter_provider_shop/screens/ProductDetailsScreen.dart';
// import 'package:flutter_application_rajeshwari/Providers/cart_provider/cart_provider.dart';
// import 'package:flutter_application_rajeshwari/Providers/product_provider/product.dart';
// import 'package:flutter_application_rajeshwari/screens/ProductDetailsScreen.dart';

// import 'package:provider/provider.dart';

// class GridProductItem extends StatelessWidget {
//   const GridProductItem({
//     Key? key,
//     // required this.id, required this.title, required this.image
//   }) : super(key: key);

//   //final String id,title,image;

//   @override
//   Widget build(BuildContext context) {
//     //final product = Provider.of<Product>(context);
//     final cart = Provider.of<Cart>(context);
//     return Consumer<Product>(
//       builder: (context, product, _) {
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(18),
//           child: GridTile(
//             child: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).pushNamed(ProductDetailsScreen.id,
//                       arguments: product.id);
//                 },
//                 child: Image.asset(product.image)),
//             footer: GridTileBar(
//               title: Text(
//                 product.title,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 10),
//               ),
//               backgroundColor: Colors.black54,
//               leading: IconButton(
//                 icon: product.isFavorite
//                     ? Icon(Icons.favorite)
//                     : Icon(Icons.favorite_border),
//                 onPressed: () {
//                   product.toggleIsFav();
//                 },
//               ),
//               trailing: IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   cart.addItem(
//                       productId: product.id,
//                       title: product.title,
//                       price: product.price);
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_provider/cart_provider.dart';
import '../Providers/product_provider/product.dart';
import '../screens/ProductDetailsScreen.dart';

class GridProductItem extends StatelessWidget {
  const GridProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailsScreen.id, arguments: product.id);
          },
          child: Image.asset(product.image, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
          leading: IconButton(
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              product.toggleIsFav();
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(
                productId: product.id,
                title: product.title,
                price: product.price,
              );
            },
          ),
        ),
      ),
    );
  }
}
