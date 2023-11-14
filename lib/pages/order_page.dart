import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kohi/model/coffee.dart';
import 'package:kohi/pages/cart_page.dart';
import 'package:provider/provider.dart';

import '../model/coffee_shop.dart';

class OrderPage extends StatefulWidget {
  final Coffee coffee;

  const OrderPage({
    super.key,
    required this.coffee
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List coffeeSizes = [
    "8oz",
    "12oz",
    "16oz"
  ];

  void addToCart(){
    Provider.of<CoffeeMenu>(context, listen: false).addToCart(widget.coffee);
    showDialog(
      context: context, builder: (context) => AlertDialog(
        title: Text("Added"),
      )
    );
  }

  void orderNow(){
    Provider.of<CoffeeMenu>(context, listen: false).addToCart(widget.coffee);
    showDialog(
      context: context, builder: (context) => AlertDialog(
        title: Text("Added"),
      )
    );
    goToCartPage();
  }

  goToCartPage(){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => CartPage()
      )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coffee.name),
        actions: <Widget>[
          IconButton(
            onPressed: goToCartPage, 
            icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  Image.asset(widget.coffee.imagePath),
                  Text(
                    widget.coffee.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )
            ),
            
            Row(
              children: [
                Text(
                  widget.coffee.price,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                 const Spacer(),
                OutlinedButton(
                  onPressed: orderNow,
                  child: const Text("Order Now"),
                ),
                 Container(width: 10, color: Colors.transparent),
                FilledButton(
                  onPressed: addToCart,
                  child: const Text("Add to cart"),
                )
              ]
            )
            
          ],
        ),
      )
      
    );
  }
}