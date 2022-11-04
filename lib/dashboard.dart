

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'AddVariants.dart';
import 'notifications.dart';
import 'cart.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';


class Dashboard extends StatefulWidget {
 final String Firstname;
 final String Lastname;
 
  const Dashboard({Key ? key, required this.Firstname,required this.Lastname}): super(key: key);
  


@override
State<Dashboard> createState() => _Dashboard();
}

@override
class _Dashboard extends State<Dashboard> {
int _selectedIndex = 0;


//   static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
//   static  List<Widget> _pages = <Widget>[
   
//       Text(
//         'Home',
//         style: optionStyle,
//       ),
//       Text(
//         'Chat',
//         style: optionStyle,
//       ),
//       Text(
//         'Profile',
//         style: optionStyle,
//       ),
//     ];

//   void _onItemTapped(int index) {
//   setState(() {
//     _selectedIndex = index;
//   });
// }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      
    appBar: AppBar(
      automaticallyImplyLeading: true,
      title: Text('${widget.Firstname} ${widget.Lastname}'),
  actions: [
     IconButton(
      icon: const Icon(
        Icons.notifications
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: ((context) => Notif())));
      },
    ),
    IconButton(
      icon: const Icon(
        Icons.shopping_cart
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: ((context) => Cart())));
      },
    )
  ],
    ),
    body: Container (
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.deepPurple]
          )
      ),
      child: Center(
      //child: _pages.elementAt(_selectedIndex),
      child: Container(
      width: double.infinity,
            padding: EdgeInsets.only(left: 80.00,right:80.00, top:100.00, bottom:100.00),
            decoration: BoxDecoration(     
            ),

            child:Column(children: <Widget>[
              Container(
              child:ElevatedButton(
               child: Text('Add Products',
                            style: TextStyle(color: Colors.black,fontSize: 24),),
                            style: ButtonStyle(
                               backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                //             ),
              ), onPressed: () { 
                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: ((context) => advars())));
               },
              ),
              )
            ])
           // child:Column(children: <Widget>[
               
              
                // Container( 
                // child:Row(children: <Widget>[
                //      SizedBox(
                //      width:200,
                //      height: 200,
                //         child: ElevatedButton(  
                //             child: Text('Add Products',
                //             style: TextStyle(color: Colors.black,fontSize: 24),),
                //             style: ButtonStyle(
                //                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                //             ),
                //             onPressed: () {
                //                  Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                   builder: ((context) => advars())));
                //             }
                //           )
                //      ),                 
                //     Spacer(),
                //       SizedBox(
                //          width: 200,
                //          height: 200,
                //             child: ElevatedButton(
                //             child: Text('View Members',style: TextStyle(color: Colors.black,fontSize: 24),),
                //             style: ButtonStyle(
                //               backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                //             ),
                //             onPressed: () {
                //             }, 
                //           ),
                //       ),       
                // ])                
                // ),         
                //     Container( 
                //       margin: EdgeInsets.only(top:50),
                // child:Row(children: <Widget>[
                //      SizedBox(
                //      width:200,
                //      height: 200,                    
                //         child: ElevatedButton(  
                //             child: Text('Orders',style: TextStyle(color: Colors.black,fontSize: 24),),
                //             style: ButtonStyle(
                //               backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                //             ),
                //             onPressed: () {
                //             }, 
                //           ),
                //      ),      
                     
                //       SizedBox(
                //          width: 200,
                //          height: 200,                    
                //             child: ElevatedButton(
                //             child: Text('Order History',style: TextStyle(color: Colors.black,fontSize: 24),),
                //             style: ButtonStyle(
                //               backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                //             ),
                //             onPressed: () {
                //             }, 
                //           ),
                //       ),       
                // ])                
                // ), 
                //  Container( 
                //   margin: EdgeInsets.only(top: 50),
                // child:Row(children: <Widget>[
                //      SizedBox(
                //      width:200,
                //      height: 200, 
                //         child: ElevatedButton(  
                //             child: Text('Inventory',style: TextStyle(color: Colors.black,fontSize: 24),),
                //             style: ButtonStyle(
                //               backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                //             ),
                //             onPressed: () {
                //             }, 
                //           ),
                //      ),    
                   
                //       SizedBox(
                //          width: 200,
                //          height: 200,
                //             child: ElevatedButton(
                //             child: Text('Sales Records',style: TextStyle(color: Colors.black,fontSize: 24),),
                //             style: ButtonStyle(
                //               backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                //             ),
                //             onPressed: () {
                //             }, 
                //           ),
                //       ),       
                // ])                
                // ),                      
            //]),

    ),
    ),
      ),
    
    // 

    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color.fromARGB(255, 73, 46, 121),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color.fromARGB(255, 182, 182, 182),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home),
            label: 'Home',),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Message',),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',)
      ],
      currentIndex: _selectedIndex,
      // onTap: _onItemTapped,
      ),
    );
  }
  

}
