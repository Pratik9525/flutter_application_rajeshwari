// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';
// import '/Providers/orders_provider/orders.dart';

// class OrderItemTile extends StatefulWidget {
//   const OrderItemTile({Key? key, required this.order}) : super(key: key);

//   final OrderItem order;

//   @override
//   State<OrderItemTile> createState() => _OrderItemTileState();
// }

// class _OrderItemTileState extends State<OrderItemTile> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(10),
//       child: Column(
//         children: [
//           ListTile(
//             title: Text('${widget.order.totalPrice} \$'),
//             subtitle: Text('${widget.order.orderTime}'),
//             trailing: IconButton(
//               icon: isExpanded
//                   ? Icon(
//                       Icons.expand_less,
//                     )
//                   : Icon(
//                       Icons.expand_more,
//                     ),
//               onPressed: () {
//                 setState(() {
//                   isExpanded = !isExpanded;
//                 });
//               },
//             ),
//           ),
//           if (isExpanded)
//             SizedBox(
//               height: widget.order.cartItems.length * 28,
//               child: ListView(
//                 children: widget.order.cartItems.map((product) => Row(
//                   children: [
//                     Expanded(child: Text(product.title)),
//                     Text("${product.qty}x"),
//                     SizedBox(width: 10,),
//                     Text(product.price),
//                   ],
//                 )).toList(),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../Providers/orders_provider/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  const OrderItem(this.order, {Key? key}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.totalPrice}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.orderTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.cartItems.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.cartItems
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${prod.qty}x \$${prod.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
