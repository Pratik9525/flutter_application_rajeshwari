// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// import '/Providers/orders_provider/orders.dart';

// import 'Providers/cart_provider/cart_provider.dart';

// import 'Providers/product_provider/ProductsPrvider.dart';
// import 'screens/MainShoppingScreen.dart';
// import 'screens/ProductDetailsScreen.dart';
// import 'screens/cart_screen.dart';
// import 'screens/order_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (BuildContext context) => Products()),
//         ChangeNotifierProvider(create: (BuildContext context) => Cart()),
//         ChangeNotifierProvider(create: (BuildContext context) => Orders()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(colorSchemeSeed: Colors.pinkAccent),
//         title: 'Flutter Demo',
//         home: const MyHomePage(),
//         routes: {
//           MainShoppingScreen.id: (c) => MainShoppingScreen(),
//           ProductDetailsScreen.id: (c) => ProductDetailsScreen(),
//           CartScreen.id: (c) => CartScreen(),
//           OrdersScreen.id: (c) => OrdersScreen(),
//         },
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MainShoppingScreen();
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/cart_provider/cart_provider.dart';
import 'Providers/product_provider/ProductsPrvider.dart';
import 'Providers/orders_provider/orders.dart';
import 'screens/MainShoppingScreen.dart';
import 'screens/ProductDetailsScreen.dart';
import 'screens/cart_screen.dart';
import 'screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.pinkAccent),
        title: 'Flutter Demo',
        home: const MyHomePage(),
        routes: {
          MainShoppingScreen.id: (c) => MainShoppingScreen(),
          ProductDetailsScreen.id: (c) => ProductDetailsScreen(),
          CartScreen.id: (c) => CartScreen(),
          OrdersScreen.id: (c) => OrdersScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainShoppingScreen();
  }
}