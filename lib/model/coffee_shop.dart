import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kohi/model/coffee.dart';

import 'order.dart';

class CoffeeMenu extends ChangeNotifier{
  List<Coffee> menu = [];
  int _qty = 0;


  List<Order> _cart = [
    Order(
      Id: 0,
      name: 'Americano',
      price: '15',
      qty: 2,
    )
  ];

  List<Coffee> _basket = [];

  List<Order> get userCart => _cart;

  List<Order> getAllOrders() {
    notifyListeners();
    return _cart;
  }

  int get qty => _qty;
  
  List<Coffee> get menus => menu;

  void addMenu(Coffee coffee){
    menu.add(coffee);
    notifyListeners();
  }

  void addToCart(Order order){
    _cart.add(order);
    notifyListeners();
  }

  void addToCartCoffee(Coffee coffee){
    _basket.add(coffee);
    notifyListeners();
  }

  void updateOrder(Order order, int qty){
    for (int i=0; i <_cart.length; i++){
      if(_cart[i].Id == order.Id){
        _cart[i].qty = qty;
      } 
    }
  }

  void removeItemFromCart(Order order){
    _cart.remove(order);
    notifyListeners();
  }
}
