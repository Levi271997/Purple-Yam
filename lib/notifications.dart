import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Notif extends StatefulWidget {
  Notif({Key ? key}): super(key:key);

@override
State<Notif> createState() => _Notif();
}

@override
class _Notif extends State<Notif>{

  // void{
  //   //function
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete
            ),
            onPressed: () {
              
            },)
        ]
      ),

    );
  }

}