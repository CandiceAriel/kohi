import 'package:flutter/material.dart';
import 'package:kohi/model/coffee_shop.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kohi/pages/cart_page.dart';

//import components
import 'package:kohi/pages/home_page.dart';
import 'package:kohi/routes.dart';
import 'package:provider/provider.dart';

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
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue.shade900,
            foregroundColor: Colors.white //here you can give the text color
          ),
          textTheme: TextTheme(
            displayLarge: const TextStyle( fontSize: 72, fontWeight: FontWeight.bold ),
            //title
            titleLarge: GoogleFonts.montserrat( fontSize: 30 ),
            titleMedium: GoogleFonts.montserrat( fontSize: 16 ),
            titleSmall: GoogleFonts.montserrat( fontSize: 14 ),
            //body
            bodyLarge: GoogleFonts.montserrat( fontSize: 16 ),
            bodyMedium: GoogleFonts.montserrat( fontSize: 14 ),
            bodySmall: GoogleFonts.montserrat( fontSize: 12),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routes,
        home: const HomePage(),
      )
    );
  }
}