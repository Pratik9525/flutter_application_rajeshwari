// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// import 'package:flutter_application_rajeshwari/Providers/product_provider/product.dart';
// import 'package:flutter_application_rajeshwari/screens/cart_screen.dart';
// import 'package:flutter_application_rajeshwari/screens/order_screen.dart';
// // import 'package:provider/provider.dart';

// // import 'package:flutter_provider_shop/Providers/product_provider/product.dart';
// // import 'package:flutter_provider_shop/screens/cart_screen.dart';
// // import 'package:flutter_provider_shop/screens/order_screen.dart';
// // // import 'package:provider/provider.dart';

// import 'package:provider/provider.dart';
// import '../Providers/product_provider/ProductsPrvider.dart';
// import '../widgets/GridProductItem.dart';

// class MainShoppingScreen extends StatefulWidget {
//   static const id = '/MainShoppingScreen';

//   const MainShoppingScreen({Key? key}) : super(key: key);

//   @override
//   State<MainShoppingScreen> createState() => _MainShoppingScreenState();
// }

// class _MainShoppingScreenState extends State<MainShoppingScreen> {
//   bool showFav = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton.extended(
//             backgroundColor: Colors.pink,
//             onPressed: () {
//               Navigator.of(context).pushNamed(OrdersScreen.id);
//             },
//             label: Text('My Orders')),
//         appBar: AppBar(
//           title: Text("Phone Shop"),
//           actions: [
//             PopupMenuButton(
//               onSelected: (int selectedVal) {
//                 if (selectedVal == 0) {
//                   setState(() {
//                     showFav = true;
//                   });
//                 }
//                 if (selectedVal == 1) {
//                   setState(() {
//                     showFav = false;
//                   });
//                 }
//               },
//               icon: Icon(Icons.more_vert),
//               itemBuilder: (_) {
//                 return [
//                   PopupMenuItem(child: Text('filter by favorite'), value: 0),
//                   PopupMenuItem(child: Text('remove filters'), value: 1),
//                 ];
//               },
//             ),
//             IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(CartScreen.id);
//                 },
//                 icon: Icon(Icons.shopping_cart_checkout))
//           ],
//         ),
//         body: ProductsGrid(
//           isFav: showFav,
//         ),
//       ),
//     );
//   }
// }

// class ProductsGrid extends StatelessWidget {
//   const ProductsGrid({
//     Key? key,
//     required this.isFav,
//   }) : super(key: key);

//   final bool isFav;

//   @override
//   Widget build(BuildContext context) {
//     // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
//     var Provider;
//     final productDate = Provider.of<Products>(context);
//     final availProducts =
//         isFav ? productDate.favoriteProducts : productDate.availProducts;

//     return GridView.builder(
//       padding: EdgeInsets.all(10),
//       itemCount: availProducts.length,
//       itemBuilder: (contex, index) {
//         return ChangeNotifierProvider<Product>.value(
//           value: availProducts[index],
//           //create: (BuildContext context) => availProducts[index],
//           child: GridProductItem(
//               // id: availProducts[index].id,
//               // title: availProducts[index].title,
//               // image: availProducts[index].image,
//               ),
//         );
//       },
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1 / 1,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 30,
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/product_provider/ProductsPrvider.dart';
import '../widgets/GridProductItem.dart';
import 'cart_screen.dart';
import 'order_screen.dart';

class MainShoppingScreen extends StatefulWidget {
  static const id = '/MainShoppingScreen';

  const MainShoppingScreen({Key? key}) : super(key: key);

  @override
  State<MainShoppingScreen> createState() => _MainShoppingScreenState();
}

class _MainShoppingScreenState extends State<MainShoppingScreen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.pink,
          onPressed: () {
            Navigator.of(context).pushNamed(OrdersScreen.id);
          },
          label: Text('My Orders'),
        ),
        appBar: AppBar(
          title: Text("Phone Shop"),
          actions: [
            PopupMenuButton(
              onSelected: (int selectedVal) {
                setState(() {
                  showFav = selectedVal == 0;
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(child: Text('Filter by favorite'), value: 0),
                  PopupMenuItem(child: Text('Remove filters'), value: 1),
                ];
              },
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.id);
              },
              icon: Icon(Icons.shopping_cart_checkout),
            ),
          ],
        ),
        body: ProductsGrid(isFav: showFav),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.isFav,
  }) : super(key: key);

  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final availProducts =
        isFav ? productData.favoriteProducts : productData.availProducts;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: availProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: availProducts[index],
          child: GridProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
      ),
    );
  }
}
