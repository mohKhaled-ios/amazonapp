import 'dart:convert';
import 'package:amazonapp/conastant/error_handlening.dart';
import 'package:amazonapp/conastant/utils.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:amazonapp/models/user.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailsServices {
  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('http://192.168.1.2:3000/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
        }),
      );

      httperrorhandling(
        response: res,
        context: context,
        onsuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showsnakbar(context, e.toString());
    }
  }

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('http://192.168.1.2:3000/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id!,
          'rating': rating,
        }),
      );

      httperrorhandling(
        response: res,
        context: context,
        onsuccess: () {},
      );
    } catch (e) {
      showsnakbar(context, e.toString());
    }
  }
}
