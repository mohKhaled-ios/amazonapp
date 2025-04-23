import 'dart:convert';

import 'package:amazonapp/common/widget/bottom_bar.dart';
import 'package:amazonapp/conastant/error_handlening.dart';
import 'package:amazonapp/conastant/utils.dart';
import 'package:amazonapp/home/screen/home_screen.dart';
import 'package:amazonapp/models/user.dart';
import 'package:amazonapp/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservice {
  void signup({
    required String name,
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    try {
      User user = User(
          id: "",
          name: name,
          password: password,
          email: email,
          address: "",
          type: "",
          token: "",
          cart: []);
      http.Response res = await http.post(
          Uri.parse("http://192.168.1.2:3000/api/signup"),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
          });
      httperrorhandling(
          response: res,
          context: context,
          onsuccess: (() async {
            showsnakbar(context, "your account created please sign in");
            //    signup-----------------------------------------------------------------------------
            // SharedPreferences preferences =
            //     await SharedPreferences.getInstance();
            // Provider.of<UserProvider>(context, listen: false).setuser(res.body);

            Navigator.pushNamedAndRemoveUntil(
                context, Homepage.routename, (route) => false);
          }));
    } catch (e) {
      showsnakbar(context, e.toString());
    }
  }

  // void signin({
  //   required String password,
  //   required String email,
  //   required BuildContext context,
  // }) async {
  //   try {
  //     http.Response res =
  //         await http.post(Uri.parse("http://192.168.1.2:3000/api/signin"),
  //             body: jsonEncode({
  //               "email": email,
  //               "passwors": password,
  //             }).toString(),
  //             headers: <String, String>{
  //           'Content-Type': 'application/json; charset=utf-8',
  //         });
  //     httperrorhandling(
  //         response: res,
  //         context: context,
  //         onsuccess: (() async {
  //           SharedPreferences preferences =
  //               await SharedPreferences.getInstance();
  //           Provider.of<UserProvider>(context, listen: false).setuser(res.body);
  //           await preferences.setString(
  //               "auth-token", jsonDecode(res.body)["token"]);
  //           Navigator.pushNamedAndRemoveUntil(
  //               context, Homepage.routename, (route) => false);
  //         }));
  //   } catch (e) {
  //     showsnakbar(context, e.toString());
  //   }
  // }

  void signin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse("http://192.168.1.2:3000/api/signin"),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
        },
      );
      httperrorhandling(
        response: res,
        context: context,
        onsuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setuser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Bottombar.routename,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showsnakbar(context, e.toString());
    }
  }

  void getuserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', "");
      }
      var tokenrespo = await http.post(
        Uri.parse("http://192.168.1.2:3000/tokenIsValid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
          'x-auth-token': token!,
        },
      );
      var respo = jsonDecode(tokenrespo.body);

      if (respo == true) {
        http.Response userrespo = await http.get(
          Uri.parse("http://192.168.1.2:3000/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
            'x-auth-token': token,
          },
        );
        var userprovider = Provider.of<UserProvider>(context, listen: false);
        userprovider.setuser(userrespo.body);
      }
    } catch (e) {
      showsnakbar(context, e.toString());
    }
  }
}
