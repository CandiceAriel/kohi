import 'package:flutter/material.dart';

import './layout/default.dart';

import './pages/cart_page.dart';
import './pages/home_page.dart';
import './pages/order_page.dart';
import './pages/shop_page.dart';


var routes = <String, WidgetBuilder>{
  '/home': (context) => DefaultScaffold(
    title: "",
    bodyWidget: const HomePage(),
  ),
  '/cart': (context) => DefaultScaffold(
    title: 'Cart',
    bodyWidget: CartPage(),
  ),
};