import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kohi/routes.dart';

import '../constants.dart';

// ignore: must_be_immutable
class DefaultScaffold extends StatefulWidget {
  DefaultScaffold({ 
    Key? key,
    required this.bodyWidget,
    this.title = '',
    this.isShowMenu = false,
    this.isShowAction = false,
    this.isBodyScroll = true,
    this.disableExpiryCheck = false,
    this.isFullWidth = false
  }) : super(key: key);

  Widget bodyWidget;
  String title;
  bool isShowMenu;
  bool isShowAction;
  bool isBodyScroll;
  bool disableExpiryCheck;
  bool isFullWidth;
  bool isNewMessage = false;
  @override
  State<DefaultScaffold> createState() => _DefaultWidgetState();
}

class _DefaultWidgetState extends State<DefaultScaffold> {
  @override
  Widget build(BuildContext context) {
    Widget tabWidget = Container(
        alignment: Alignment.center,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // constraints:
                  //     BoxConstraints(maxWidth: ScreenConstants.maxWidth),
                  child: widget.bodyWidget),
            ]));

    return Scaffold(
      appBar: AppBar(
        title: Text("Kohi"),
        actions: <Widget>[
          IconButton(
            onPressed: goToCartPage, 
            icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: SafeArea(
        child: widget.isBodyScroll
          ? SingleChildScrollView(
            child: widget.isFullWidth ||
              MediaQuery.of(context).size.width < ScreenConstants.tabWidth
              ? widget.bodyWidget
              : tabWidget
          )
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: widget.isFullWidth ||
              MediaQuery.of(context).size.width < ScreenConstants.tabWidth
              ? widget.bodyWidget
              : tabWidget
          )
        ),
    );
  }

  goToHomePage(){
    Navigator.pushNamed(context, '/home');
  }

  goToCartPage(){
    Navigator.pushNamed(context, '/cart');
  }
}