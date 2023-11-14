import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/coffee.dart';
import '../model/coffee_shop.dart';

class ProductListTile extends StatelessWidget {
  final Coffee coffee;
  final int qty;
  void Function()? onPressed;

  ProductListTile({
    Key? key, 
    required this.coffee, 
    required this.qty,
    required this.onPressed
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffee.name,
                style: const TextStyle( fontSize: 20, fontWeight: FontWeight.w800 ),
              ),
              Text(
                coffee.price,
                style: const TextStyle( fontSize: 16),
              )
            ],
          ),
          const Spacer(),
           IconButton(
              icon: const Icon(Icons.delete), onPressed: onPressed),
        ],
      ),
    );
  }
}
