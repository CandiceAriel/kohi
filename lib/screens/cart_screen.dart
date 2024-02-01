import 'package:flutter/material.dart';
import 'package:kohi/components/list_tile.dart';
import 'package:kohi/model/coffee_shop.dart';
import 'package:provider/provider.dart';

import '../model/coffee.dart';
import '../model/order.dart';

class CartPage extends StatefulWidget {

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List cartItems = [];

  void getUserCartList() {
    final cartItemList = Provider.of<CoffeeMenu>(context, listen: false).userCart;
    var uniqueOrders = cartItemList.toSet().toList();
    cartItems.add(uniqueOrders);
  }

  void removeFromCart(Order order){
    Provider.of<CoffeeMenu>(context, listen: false).removeItemFromCart(order);
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        title: Text("Removed"),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    getUserCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeMenu>(
      builder: (context, value, child) {
       return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        color: Colors.blue.shade900,
        child: Column(
          children: [
            Expanded(
              child: value.getAllOrders().isNotEmpty
              ? ListView.builder(
                  itemCount: value.getAllOrders().length,
                  itemBuilder: (context, index) {
                    Order coffeeItem = value.getAllOrders()[index];
                    return ProductListTile(
                      order: coffeeItem,
                      qty: value.qty,
                      onPressed: () => removeFromCart(coffeeItem)
                    );
                  },
              )
              : Center(
                child: Text("Cart is empty")
              ),
            ),
          ],
        ),
      );
          
        
        
      }
    );
  }
}