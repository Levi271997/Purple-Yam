import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:purple_yum_app/dashboard_customer.dart';
import 'signup.dart';
import 'package:purple_yum_app/dashboard.dart';
import 'dashboard1.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  
  final String title;
  const MyHomePage({super.key, required this.title});

 @override
  State<StatefulWidget> createState() {
     return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
 late String errormsg;
  late bool error, showprogress;
  late String number, password;

  var _number = TextEditingController();
  var _password = TextEditingController();
  
  
 startLogin() async {
     String apiurl = "http://192.168.0.108/purple_yam/server.php";
     var response = await http.post(Uri.parse(apiurl), body: {  
        'number': number, 
        'password': password  
     });
       
     if(response.statusCode == 200){
         var jsondata = json.decode(response.body);
         if(jsondata["error"]){
             setState(() {
                 showprogress = false; 
                 error = true;
                 errormsg = jsondata["message"];
             });
         }else{
            if(jsondata["success"]){
               setState(() {
                  error = false;
                  showprogress = false;

              _number.text="";
              _password.text="";
              String uid = jsondata["user_id"];
              String role=jsondata["role"];
              String firstname=jsondata["firstname"];
              String lastname=jsondata["lastname"];

              if(role =="admin"){
              
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: ((context) => Dashboard(Firstname: firstname,Lastname: lastname,))));
              }else{
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: ((context) => Dashboard_Customer(Firstname: firstname,Lastname: lastname,))));
              }
                   

               });
            
             
               
            }else{
               showprogress = false;
               error = true;
               errormsg = "Something went wrong.";
            }  
         }
     }else{
        setState(() {
           showprogress = false; 
           error = true;
           errormsg = "Connection error with server.";
        });
     }
  }
@override
  void initState() {
     number = "";
     password = "";
     errormsg = "";
     error = false;
     showprogress = false;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
             begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0,
                1,   
              ],
              colors: [
                Colors.white,
                Colors.purple,  
              ],
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                      Image(image: AssetImage('assets/images/PurpleLogo.png')
                      ),

                      Container( 
                         margin: EdgeInsets.only(top:30),
                         padding: EdgeInsets.all(10),
                         child:error? errmsg(errormsg):Container(),
                        
                     ),

                      Container(
                        child: TextField(
                           controller: _number,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration( enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red)
                              ),
                              labelText: 'Email or Phone',
                              labelStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.all(20.0),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              )
                            ),
                            onChanged: (value){
                              number = value;
                            },
                          ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            top: 5.0, right: 0, bottom: 0, left: 0
                          ),
                          child: TextField(
                             controller: _password,
                            textAlign: TextAlign.left,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration( enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red)
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.all(20.0),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                              )
                            ),
                            onChanged: (value){
                              password = value;
                            },
                          ),
                        ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            //child: Text('Login'),
                            style: ButtonStyle(
                            
                            ),
                            onPressed: () {
                            setState(() {
                                        showprogress = true;
                                     });
                                     startLogin();
                            },
                            child: showprogress?
                              SizedBox(
                                height: 30, width:30,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.purple[20] ,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
                                  ),
                              ):Text("Login")
                          ),
                        ),
                      Container(
                          width: double.infinity,
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.white,
                            decoration: TextDecoration.underline)
                          ),
                        ),
                  ],
                ),
            ),
            Container(
                child: Column(
                  children: <Widget> [
                    RichText(
                      text: TextSpan(
                        text: 'Sign Up For Free',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline
                        ),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const SignUp())));
                          }
                        ))
                    
                    ]
                ),
            )
          ],
        )
      )
    );
  }

   Widget errmsg(String text){
  //error message widget.
        return Container(
            padding: EdgeInsets.all(15.00),
            margin: EdgeInsets.only(bottom: 10.00),
            decoration: BoxDecoration( 
               borderRadius: BorderRadius.circular(30),
               color: Colors.red,
               border: Border.all(color:Color.fromARGB(255, 243, 8, 8), width:2)
            ),
            child: Row(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right:6.00),
                    child: Icon(Icons.info, color: Colors.white),
                ), // icon for error message
                
                Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
                //show error message text
            ]),
        );
  }
}

