import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kohi/model/coffee.dart';

class CoffeeMenu extends ChangeNotifier{
  List<Coffee> menu = [];
  int _qty = 0;


  List<Coffee> _cart = [];

  List<Coffee> get userCart => _cart;

  int get qty => _qty;
  
  List<Coffee> get menus => menu;

  void addMenu(Coffee coffee){
    menu.add(coffee);
    notifyListeners();
  }

  void addToCart(Coffee coffee){
    _cart.add(coffee);
    _qty++;
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee){
    _cart.remove(coffee);
    notifyListeners();
  }
}
