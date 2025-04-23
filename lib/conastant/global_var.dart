import 'package:flutter/material.dart';

String uri = "http://192.168.1.2:3000";

class Globalvar {
  static const appcolor = LinearGradient(colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216),
  ], stops: [
    0.5,
    1.0
  ]);
  static const secondarycolor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundcolor = Colors.white;
  static const Color greybackgroundcolor = Color(0xffebecee);
  static var selectednavbarcolor = Colors.cyan[800]!;
  static const unselectednavbarcolor = Colors.black87;

  static const List<Map<String, String>> categoriesimages = [
    {'title': 'Books', 'image': 'assets/images/books.jpeg'},
    {'title': 'Mobiles', 'image': 'assets/images/books.jpeg'},
    {'title': 'Appliances', 'image': 'assets/images/books.jpeg'},
    {'title': 'healthy', 'image': 'assets/images/books.jpeg'},
    {'title': 'Fashion', 'image': 'assets/images/books.jpeg'}
  ];

  static const List<String> carsoleimages = [
    "https://images-eu.ssl-images-amazon.com/images/I/41uJVBj4CcL._AC_SX184_.jpg",
    "https://images-eu.ssl-images-amazon.com/images/I/512BVRrBKjL._AC_SX184_.jpg",
    "https://images-eu.ssl-images-amazon.com/images/I/41-fUngc2sL._AC_SX184_.jpg",
    "https://images-eu.ssl-images-amazon.com/images/I/41StWyofl6L._AC_SX184_.jpg",
  ];
}
