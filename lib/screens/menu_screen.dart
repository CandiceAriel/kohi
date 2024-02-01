import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:kohi/components/card_tile.dart';
import 'package:kohi/screens/order_screen.dart';

import '../model/coffee.dart';
import '../model/coffee_shop.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  
  List listCoffee = [];

  Future<List<Coffee>> readJson() async {
    final String response = await rootBundle.loadString('assets/json/coffee.json');
    // final data =  json.decode(response);
    // final dataCoffee = data['coffee'];
    List<dynamic> parsedListJson = jsonDecode(response)['coffee'];
    List<Coffee> itemsList = List<Coffee>.from(parsedListJson.map<Coffee>((dynamic i) => Coffee.fromJson(i))).toList();
    for (var item in itemsList) {
      Provider.of<CoffeeMenu>(context, listen: false).addMenu(item);
    }

    return itemsList;
  }
  
  void goToOrderPage(Coffee coffee){
    // Provider.of<CoffeeMenu>(context, listen: false).addItemToCart(coffee);
    // showDialog(
    //   context: context, builder: (context) => AlertDialog(
    //     title: Text("Added"),
    //   )
    // );
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => OrderPage(coffee: coffee)
      )
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }
  
  @override
  Widget build(BuildContext context) {

    return Consumer<CoffeeMenu>(
      builder: (c, value, ch) => Container(
        color: Colors.blue.shade900,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: Text(
                  'Hi, User! What can we get you today?',
                  style:  Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                ),
              ),
              
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2.6,
                    crossAxisSpacing: 10, 
                    mainAxisSpacing: 20
                  ),
                  itemCount: value.menus.length,
                  itemBuilder: (context, index){
                    if(value.menus.isNotEmpty) {
                      Coffee eachCoffee = value.menus[index];
                      return CardTile(coffee: eachCoffee, onPressed: () => goToOrderPage(eachCoffee));
                    } else {
                      return Text('No menu available');
                    }
                  }
                )
              )
            ]
          ),
        ),
      )
    );
  }
}