import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final List<String> _user = ['John', 'Alice', 'Andrew'];

  int get count => _user.length;
  List<String> get user => _user;

  // void addItem(String item) {
  //   _shoppingCart.add(item);
  //   notifyListeners();
  // }
}