import 'package:flutter/material.dart';
import 'package:flutter_application_rajeshwari/Providers/cart_provider/cart_provider.dart';

class OrderItem {
  OrderItem({
    required this.id,
    required this.totalPrice,
    required this.orderTime,
    required this.cartItems,
  });

  final String id;
  final double totalPrice;
  final DateTime orderTime;
  final List<CartItem> cartItems;
}

class Orders with ChangeNotifier {
  final List<OrderItem> _myOrders = [];

  List<OrderItem> get myOrders {
    return [..._myOrders];
  }

  void addOrder({
    required List<CartItem> cartItems,
    required double totalPrice,
  }) {
    _myOrders.add(
      OrderItem(
          id: DateTime.now().toString(),
          totalPrice: totalPrice,
          orderTime: DateTime.now(),
          cartItems: cartItems),
    );
    notifyListeners();
  }
}
