import 'package:flutter/material.dart';
import 'package:kohi/pages/cart_page.dart';
import 'package:kohi/pages/home_page.dart';
import 'package:kohi/pages/order_page.dart';
import 'package:kohi/pages/shop_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch ( settings.name){
      case '/cart':
         return MaterialPageRoute(builder: (context) => CartPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}

