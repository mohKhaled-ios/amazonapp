import 'package:amazonapp/models/user.dart';
import "package:flutter/material.dart";

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: "",
      name: "",
      password: "",
      email: "",
      address: "",
      type: "",
      token: "",
      cart: []);
  User get user => _user;
  void setuser(String userData) {
    _user = User.fromJson(userData);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
