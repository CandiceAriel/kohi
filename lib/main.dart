import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kohi/model/coffee_shop.dart';
import 'package:kohi/screens/cart_screen.dart';

//import components
import 'package:kohi/screens/home_screen.dart';
import 'package:kohi/routes.dart';
import 'package:provider/provider.dart';
import 'package:kohi/globals/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeMenu(),
      builder: (context, child) => MaterialApp(
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routes,
        home: const HomePage(),
      )
    );
  }
}