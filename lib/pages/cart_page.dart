import 'package:flutter/material.dart';
import 'package:kohi/components/list_tile.dart';
import 'package:kohi/model/coffee_shop.dart';
import 'package:provider/provider.dart';

import '../model/coffee.dart';
import '../model/order.dart';

class CartPage extends StatefulWidget {

  CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List cartItems = [];

  void getUserCartList() {
    final cartItemList = Provider.of<CoffeeMenu>(context, listen: false).userCart;
    var uniqueOrders = cartItemList.toSet().toList();
    cartItems.add(uniqueOrders);
    print(uniqueOrders.length);
  }

  void removeFromCart(Order order){
    Provider.of<CoffeeMenu>(context, listen: false).removeItemFromCart(order);
    showDialog(
      context: context, builder: (context) => AlertDialog(
        title: Text("Removed"),
      )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeMenu>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text("Your Orders"),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.blue.shade900,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getAllOrders().length,
                    itemBuilder: (context, index) {
                      Order coffeeItem = value.getAllOrders()[index];
                      //ProductListTile(coffee: coffee);
                      if( value.getAllOrders().isNotEmpty){
                        return ProductListTile(order: coffeeItem, qty: value.qty, onPressed: () => removeFromCart(coffeeItem));
                      } else {
                        return Text("Cart is empty");
                      }
                    }
                  )
                )
              ],
            )
          )
          
        )
        
      )
    );
  }
}