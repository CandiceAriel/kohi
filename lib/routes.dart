import 'package:flutter/material.dart';

import './layout/default.dart';

import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/order_screen.dart';
import 'screens/menu_screen.dart';


var routes = <String, WidgetBuilder>{
  '/home': (context) => DefaultScaffold(
    bodyWidget: const HomePage(),
  ),
  '/cart': (context) => DefaultScaffold(
    title: 'Cart',
    bodyWidget: const CartPage(),
  ),
};