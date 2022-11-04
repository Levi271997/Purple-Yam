import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Cart extends StatefulWidget {
  Cart({Key ? key}): super(key:key);

@override
State<Cart> createState() => _Cart();
}

@override
class _Cart extends State<Cart>{

  // void{
  //   //function
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete
            ),
            onPressed: () {
              
            },
          )
        ]
      ),
    );
  }

}