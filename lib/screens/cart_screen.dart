// import 'package:flutter/material.dart';
// import 'package:flutter_application_rajeshwari/Providers/cart_provider/cart_provider.dart';
// import 'package:flutter_application_rajeshwari/Providers/orders_provider/orders.dart';
// import 'package:flutter_application_rajeshwari/widgets/cart_item.dart';
// // import 'package:flutter_provider_shop/Providers/cart_provider/cart_provider.dart';
// // import 'package:flutter_provider_shop/Providers/orders_provider/orders.dart';
// // import 'package:flutter_provider_shop/widgets/cart_item.dart';
// // import 'package:flutter_provider_shopping/Providers/cart_provider/cart_provider.dart';
// // import 'package:flutter_provider_shopping/Providers/orders_provider/orders.dart';
// // import 'package:flutter_provider_shopping/widgets/cart_item.dart';
// import 'package:provider/provider.dart';

// class CartScreen extends StatelessWidget {
//   static const id = '/CartScreen';
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Cart'),
//       ),
//       body: Column(
//         children: [
//           Card(
//             margin: const EdgeInsets.all(20),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Total'),
//                   const Spacer(),
//                   Chip(label: Text("${cart.totalToPay.toString()} \$")),
//                   TextButton(
//                       onPressed: () {
//                         Provider.of<Orders>(context, listen: false).addOrder(
//                             cartItems: cart.items.values.toList(),
//                             totalPrice: cart.totalToPay);
//                         cart.clearCart();
//                       },
//                       child: const Text("Order Now"))
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: cart.items.length,
//                 itemBuilder: (context, index) => CartItemTile(
//                       id: cart.items.values.toList()[index].id,
//                       title: cart.items.values.toList()[index].title,
//                       price: cart.items.values.toList()[index].price,
//                       qty: cart.items.values.toList()[index].qty,
//                       productId: cart.items.keys.toList()[index],
//                     )),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_rajeshwari/Providers/cart_provider/cart_provider.dart';
import 'package:flutter_application_rajeshwari/Providers/orders_provider/orders.dart';
import 'package:flutter_application_rajeshwari/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const id = '/CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalToPay.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .titleLarge
                            ?.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cartItems: cart.items.values.toList(),
                        totalPrice: cart.totalToPay,
                      );
                      cart.clearCart();
                    },
                    child: const Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItemWidget(
                id: cart.items.values.toList()[i].id,
                productId: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].qty,
                title: cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
