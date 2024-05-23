// // ignore_for_file: prefer_final_fields, file_names

// import 'package:flutter/material.dart';

// import 'product.dart';

// class Products with ChangeNotifier{

//    List<Product> _availProducts = [
//     Product(
//         id: '1001',
//         title: 'Samsung',
//         description: "it's a phone",
//         image: 'assets/images/samsung.jpeg',
//         price: 1000),
//     Product(
//         id: '1002',
//         title: 'iphone',
//         description: "it's a phone",
//         image: 'assets/images/iphone.jpg',
//         price: 1000),
//     Product(
//         id: '1003',
//         title: 'realme',
//         description: "it's a phone",
//         image: 'assets/images/realme.jpeg',
//         price: 1000),
//     Product(
//         id: '1004',
//         title: 'nokia',
//         description: "it's a phone",
//         image: 'assets/images/nokia.jpg',
//         price: 1000),
//     Product(
//         id: '1005',
//         title: 'oneplus',
//         description: "it's a phone",
//         image: 'assets/images/oneplus.jpeg',
//         price: 1000),
//   ];

//    List<Product>get favoriteProducts{
//      return _availProducts.where((product)=> product.isFavorite).toList();
//    }

//    List<Product> get availProducts => _availProducts;

//    // void addProduct(value){
//    //   _availProducts.add(value);
//    //   notifyListeners();
//    // }

//    Product findById(String id){
//      return _availProducts.firstWhere((product)=> product.id == id);
//    }
// }

// ignore_for_file: prefer_final_fields, file_names

import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _availProducts = [
    Product(
        id: '1001',
        title: 'Samsung',
        description: "it's a phone",
        image: 'assets/images/samsung.jpeg',
        price: 1000),
    Product(
        id: '1002',
        title: 'iPhone',
        description: "it's a phone",
        image: 'assets/images/iphone.jpg',
        price: 1000),
    Product(
        id: '1003',
        title: 'Realme',
        description: "it's a phone",
        image: 'assets/images/realme.jpeg',
        price: 1000),
    Product(
        id: '1004',
        title: 'Nokia',
        description: "it's a phone",
        image: 'assets/images/nokia.jpg',
        price: 1000),
    Product(
        id: '1005',
        title: 'OnePlus',
        description: "it's a phone",
        image: 'assets/images/oneplus.jpeg',
        price: 1000),
  ];

  List<Product> get favoriteProducts {
    return _availProducts.where((product) => product.isFavorite).toList();
  }

  List<Product> get availProducts => _availProducts;

  Product findById(String id) {
    return _availProducts.firstWhere((product) => product.id == id);
  }
}
