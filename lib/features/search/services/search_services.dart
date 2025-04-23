import 'dart:convert';

import 'package:amazonapp/conastant/error_handlening.dart';
import 'package:amazonapp/conastant/utils.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Searchservices {
  Future<List<Product>> fetchSearchedProduct({
    required BuildContext context,
    required String searchQuery,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('http://192.168.1.2:3000/api/products/search/$searchQuery'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httperrorhandling(
        response: res,
        context: context,
        onsuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showsnakbar(context, e.toString());
    }
    return productList;
  }
}
