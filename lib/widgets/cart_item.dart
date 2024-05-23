// import 'package:flutter/material.dart';
// import 'package:flutter_application_rajeshwari/Providers/cart_provider/cart_provider.dart';
// // import 'package:flutter_provider_shop/Providers/cart_provider/cart_provider.dart';
// import 'package:provider/provider.dart';

// class CartItemTile extends StatelessWidget {
//   const CartItemTile(
//       {Key? key,
//       required this.id,
//       required this.title,
//       required this.productId,
//       required this.price,
//       required this.qty})
//       : super(key: key);

//   final String id;
//   final String title;
//   final String productId;
//   final String price;
//   final int qty;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       child: ListTile(
//         leading: Text(price.toString()),
//         title: Text(title.toString()),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("x${qty.toString()}"),
//             Text('\$${double.parse(price) * qty}')
//           ],
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.delete),
//           onPressed: () {
//             Provider.of<Cart>(context, listen: false).removeItem(productId);
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/cart_provider/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final String price;
  final int quantity;
  final String title;

  const CartItemWidget({
    Key? key,
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('\$$price'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(double.parse(price) * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
