import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/coffee.dart';
import '../model/coffee_shop.dart';

class CardTile extends StatelessWidget {
  final Coffee coffee;
  void Function() onPressed;
  CardTile({Key? key, required this.coffee, required this.onPressed}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeMenu>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,//
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    margin:EdgeInsets.only(bottom: 20.0),
                    child:  Center(
                      child:  Image.asset(coffee.imagePath),
                    ), 
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffee.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ), 
                        Text(
                          coffee.price,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500]
                          ),
                        )
                      ],
                    )
                  ),
                ],
              )
            ) ,
          ),
        )
        
        
      )
    );
  }
}
