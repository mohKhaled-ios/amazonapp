import 'dart:convert';
import 'dart:io';

import 'package:amazonapp/conastant/error_handlening.dart';
import 'package:amazonapp/conastant/utils.dart';
import 'package:amazonapp/models/producte.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdmainServices {
  void addProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('dmqou44uh', 'bygykhkq');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name), //////////////
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      http.Response res = await http.post(
        Uri.parse(
            'http://192.168.1.2:3000/admin/add-product'), ////////////////////
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httperrorhandling(
        response: res,
        context: context,
        onsuccess: () {
          showsnakbar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showsnakbar(context, e.toString());
    }
  }

  //// get all product for admin
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
          Uri.parse('http://192.168.1.2:3000/admin/get-products'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'x-auth-token': userProvider.user.token,
          });

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
