import 'dart:io';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'notifications.dart';
import 'cart.dart';
// import 'package:carousel_pro/carousel_pro.dart';

// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class Dashboard_Customer extends StatefulWidget {
  final String Firstname;
 final String Lastname;
 
  const Dashboard_Customer({Key ? key, required this.Firstname,required this.Lastname}): super(key: key);
  

@override
State<Dashboard_Customer> createState() => _Dashboard_Customer();
}

@override
class _Dashboard_Customer extends State<Dashboard_Customer> {
  int _selectedIndex = 0;
 static int pageindex=0;
 

 static List<Widget> _demo=[
    Container(height: 300,color: Colors.amber),
              Container(height: 300,color: Colors.black),
              Container(height: 300,color: Colors.blue),
              Container(height: 300,color: Colors.green),
  ];

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static  List<Widget> _pages = <Widget>[
    Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20.00,right:20.00,top:30),
            
            child:Column(children: <Widget>[   

            // Container(
            //   child: Center(
            //     child:ListView(
            //       children: [
            //         SizedBox(
            //           height: 200,
            //           width: double.infinity,
            //           child: Carousel(
            //             images: [
            //               Image(image: AssetImage('assets/images/cake-idea-4.jpg'),fit: BoxFit.cover,), 
                         
            //             ],
            //           ),
            //         )
            //       ],)
            //   ),
            // ),


              Container(
                height: 300,
                width: double.infinity,
                child:PageView(
                  pageSnapping: true,
                  
                  children: [
                    Container(
                      height: 300,
                      child:Image(image: AssetImage('assets/images/cake-idea-4.jpg'),height:300,fit: BoxFit.fill,), 
                    ),
                     Container(
                      height: 300,
                      child:Image(image: AssetImage('assets/images/cake.jpg'),height:300,fit: BoxFit.fill,), 
                    ),
                     Container(
                      height: 300,
                      child:Image(image: AssetImage('assets/images/chocolate.jpg'),height:300,fit: BoxFit.fill,), 
                    ),
                     Container(
                      height: 300,
                      child:Image(image: AssetImage('assets/images/purple-cake.jpg'),height:300,fit: BoxFit.fill,), 
                    ),
                  ],
                 controller: PageController(),
                // onPageChanged: onPageChanged,
                         
                ),
              ),
              SizedBox(height: 10,),
              CarouselIndicator(
                count:_demo.length,
                index:pageindex,
              ),


                Container( 
                  
                  margin: EdgeInsets.only(top: 50),
                child:Row(               
                  children: <Widget>[
                     Container(
                     width:270,
                     height: 200,
                   decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),

                           boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 0.0,
                      spreadRadius:0.0,
                    ), 
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), 
                  ],

                    ),
                     child:Column(
                     
                      children: <Widget>[
                        Container(
                         
                          width: double.infinity,
                          child:Image(image: AssetImage('assets/images/cake-idea-4.jpg'),height:120,fit: BoxFit.fill,), 
                        ),
                        Container(
                          
                          child:Text("Cake 1",style: TextStyle(fontSize: 18),),
                        ),
                        Container(
                          width: double.infinity,
                          child:Row(
                           children: <Widget>[
                            Spacer(),
                            Container(
                                child: ElevatedButton(    
                                child: Text('View',
                                style: TextStyle(color: Colors.white,fontSize: 18),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),),
                                onPressed: () {}, 
                                ),
                             ),
                             Spacer(),
                             Container(
                                child: ElevatedButton(    
                                child: Text('Add to Cart',
                                style: TextStyle(color: Colors.black,fontSize: 18),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),),
                                onPressed: () {}, 
                                ),
                             ),
                             Spacer(),
                           ],
                          )
                        )
                      ],
                     ),

                        // child: ElevatedButton(    
                        //      child: Text('Product 1',
                        //      style: TextStyle(color: Colors.black,fontSize: 24),),
                        //      style: ButtonStyle(
                        //         backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        //     ),
                        //     onPressed: () {
                        //     }, 
                        //   ),
                     ),                 
                     Spacer(),
                     Container(
                     width:270,
                     height: 200,
                   decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),

                           boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 0.0,
                      spreadRadius:0.0,
                    ), 
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), 
                  ],

                    ),
                     child:Column(
                     
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child:Image(image: AssetImage('assets/images/chocolate.jpg'),height:120,fit: BoxFit.fill,), 
                        ),
                        Container(
                          
                          child:Text("Cake 1",style: TextStyle(fontSize: 18),),
                        ),
                        Container(
                          width: double.infinity,
                          child:Row(
                           children: <Widget>[
                            Spacer(),
                            Container(
                                child: ElevatedButton(    
                                child: Text('View',
                                style: TextStyle(color: Colors.white,fontSize: 18),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),),
                                onPressed: () {}, 
                                ),
                             ),
                             Spacer(),
                             Container(
                                child: ElevatedButton(    
                                child: Text('Add to Cart',
                                style: TextStyle(color: Colors.black,fontSize: 18),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),),
                                onPressed: () {}, 
                                ),
                             ),
                             Spacer(),
                           ],
                          )
                        )
                      ],
                     ),

                        // child: ElevatedButton(    
                        //      child: Text('Product 1',
                        //      style: TextStyle(color: Colors.black,fontSize: 24),),
                        //      style: ButtonStyle(
                        //         backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        //     ),
                        //     onPressed: () {
                        //     }, 
                        //   ),
                     ),       
                ])                
                ),         
                    Container( 
                      margin: EdgeInsets.only(top:20),
                child:Row(children: <Widget>[
                      Container(
                     width:270,
                     height: 200,
                   decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),

                           boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 0.0,
                      spreadRadius:0.0,
                    ), 
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), 
                  ],

                    ),
                     child:Column(
                     
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child:Image(image: AssetImage('assets/images/cake.jpg'),height:120,fit: BoxFit.fill,), 
                        ),
                        Container(
                          
                          child:Text("Cake 1",style: TextStyle(fontSize: 18),),
                        ),
                        Container(
                          width: double.infinity,
                          child:Row(
                           children: <Widget>[
                            Spacer(),
                            Container(
                                child: ElevatedButton(    
                                child: Text('View',
                                style: TextStyle(color: Colors.white,fontSize: 18),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),),
                                onPressed: () {}, 
                                ),
                             ),
                             Spacer(),
                             Container(
                                child: ElevatedButton(    
                                child: Text('Add to Cart',
                                style: TextStyle(color: Colors.black,fontSize: 18),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),),
                                onPressed: () {}, 
                                ),
                             ),
                             Spacer(),
                           ],
                          )
                        )
                      ],
                     ),

                        // child: ElevatedButton(    
                        //      child: Text('Product 1',
                        //      style: TextStyle(color: Colors.black,fontSize: 24),),
                        //      style: ButtonStyle(
                        //         backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        //     ),
                        //     onPressed: () {
                        //     }, 
                        //   ),
                     ),      
                     Spacer(),
                        Container(
                     width:270,
                     height: 200,
                   decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),

                           boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 0.0,
                      spreadRadius:0.0,
                    ), 
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), 
                  ],

                    ),
                     child:Column(
                     
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child:Image(image: AssetImage('assets/images/cake-2.jpg'),height:120,fit: BoxFit.fill,), 
                        ),
                        Container(
                          
                          child:Text("Cake 1",style: TextStyle(fontSize: 18),),
                        ),
                        Container(
                          width: double.infinity,
                          
                          child:Row(
                           children: <Widget>[
                            Spacer(),
                            Container(
                                child: ElevatedButton(    
                                child: Text('View',
                                style: TextStyle(color: Colors.white,fontSize: 18),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),),
                                onPressed: () {}, 
                                ),
                             ),
                             Spacer(),
                             Container(
                                child: ElevatedButton(    
                                child: Text('Add to Cart',
                                style: TextStyle(color: Colors.black,fontSize: 18),),
                                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),),
                                onPressed: () {}, 
                                ),
                             ),
                             Spacer(),
                           ],
                          )
                        )
                      ],
                     ),

                        // child: ElevatedButton(    
                        //      child: Text('Product 1',
                        //      style: TextStyle(color: Colors.black,fontSize: 24),),
                        //      style: ButtonStyle(
                        //         backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        //     ),
                        //     onPressed: () {
                        //     }, 
                        //   ),
                     ),        
                ])                
                ), 
                                      
            ]),

    ),
      Text(
        'Home',
        style: optionStyle,
      ),
      Text(
        'Chat',
        style: optionStyle,
      ),
      Text(
        'Profile',
        style: optionStyle,
      ),
    ];

    
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
//  void onPageChanged(int index){
//   setState(() {
//      pageindex=index;
//   });
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      


  //   appBar: AppBar(
  //     automaticallyImplyLeading: false,

  //      title: Text('${widget.Firstname} ${widget.Lastname}'),
  //           actions: [
  //  IconButton(onPressed: () => exit(0), icon: Image(image: AssetImage('assets/images/PurpleLogo.png')
  //              ),),
  //    IconButton(
  //     icon: const Icon(
  //       Icons.notifications
  //     ),
  //     onPressed: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //         builder: ((context) => Notif())));
  //     },
  //   ),
  //   IconButton(
  //     icon: const Icon(
  //       Icons.shopping_cart
  //     ),
  //     onPressed: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //         builder: ((context) => Cart())));
  //     },
  //   )
  // ],
     
 
  //   ),

  // body: Container (
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment.topRight,
  //         end: Alignment.bottomLeft,
  //         colors: [Colors.white, Colors.deepPurple]
  //         )
  //     ),
  //     child: Center(
  //     child: _pages.elementAt(_selectedIndex),
  //   ),
  //     ),



    body: Container (

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.white, Colors.deepPurple]
          )
      ),
   
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 80,
              
              child:Row(
                children: <Widget>[
                  Container(    
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                           children: <Widget>[
                              Image(image: AssetImage('assets/images/PurpleLogo.png')),
                              Container(margin: EdgeInsets.only(left: 20),
                                child: Text('${widget.Firstname} ${widget.Lastname}',
                                       style: TextStyle(fontSize: 18)
                                       )
                              ),
                             
                             SizedBox(width: 260),
                              IconButton(
                                onPressed: () => exit(0),
                                icon: const Icon(Icons.notifications),),
                                IconButton(
                                  onPressed:() => exit(0),
                                   icon: const Icon(Icons.shopping_cart),
                                   )

                           ], 
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),

            Container(
              child:SingleChildScrollView(
                  child: _pages.elementAt(_selectedIndex),
              ),

              
            )
           ],
        ),
      ),
    
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
        onTap: _onItemTapped,
        ),
    );
  }
  

}