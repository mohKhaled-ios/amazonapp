import 'dart:convert';

import 'package:amazonapp/conastant/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

void httperrorhandling({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onsuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onsuccess();
      break;
    case 400:
      showsnakbar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showsnakbar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showsnakbar(context, response.body);
  }
}
