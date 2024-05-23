// import 'package:flutter/material.dart';
// import 'package:flutter_application_rajeshwari/Providers/orders_provider/orders.dart';
// import 'package:flutter_application_rajeshwari/widgets/order_item.dart';
// import 'package:provider/provider.dart';
// // import 'package:flutter_provider_shop/Providers/orders_provider/orders.dart';
// // import 'package:flutter_provider_shop/widgets/order_item.dart';
// // import 'package:provider/provider.dart';

// class OrdersScreen extends StatelessWidget {
//   static const id = '/OrdersScreen';
//   const OrdersScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final orders = Provider.of<Orders>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Orders'),
//       ),
//       body: ListView.builder(
//           itemCount: orders.myOrders.length,
//           itemBuilder: (context, index) => OrderItemTile(
//                 order: orders.myOrders[index],
//               )),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/orders_provider/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const id = '/OrdersScreen';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.myOrders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.myOrders[i]),
      ),
    );
  }
}
