import 'dart:convert';

import 'package:amazonapp/conastant/error_handlening.dart';
import 'package:amazonapp/conastant/utils.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:amazonapp/models/user.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Cartservices {
  void removefromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.delete(
        Uri.parse('http://192.168.1.2:3000/api/remove-from-cart/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
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
}
