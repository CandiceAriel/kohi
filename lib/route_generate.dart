import 'package:flutter/material.dart';
import 'package:kohi/screens/cart_screen.dart';
import 'package:kohi/screens/home_screen.dart';
import 'package:kohi/screens/order_screen.dart';
import 'package:kohi/screens/menu_screen.dart';

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

