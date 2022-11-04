import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purple_yum_app/main.dart';
import 'verify.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/widgets.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUp();
}
class _SignUp extends State<SignUp> {
  TextEditingController _firstname = new TextEditingController();
  TextEditingController _lastname = new TextEditingController();
  TextEditingController _mobile = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _msgerror=new TextEditingController();
  late bool error,emptyfields, sending, success;
  late String msg, firstname, lastname,number,password;
 static const platform = const MethodChannel('sendSms');
 
@override
  void initState() {
    emptyfields=false;
      error = false;
      sending = false;
      success = false;
      msg = "";
      super.initState();
  }


  void _showsuccessToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('This is a success test'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  bool? get _errorText{
    final fnametxt=_firstname.value.text;
    final lnametxt= _lastname.value.text;
    final num= _mobile.value.text;
    final password= _password.value.text;
    var fieldsvalidateempty=false;
    if(fnametxt.isEmpty || lnametxt.isEmpty || num.isEmpty || password.isEmpty){
      fieldsvalidateempty=true;
      return fieldsvalidateempty;
    }else{
      return fieldsvalidateempty;
    }
  }
  
  sendData() async {   
    String phpurl = "http://192.168.0.108/purple_yam/registeruser.php";
    var res = await http.post(Uri.parse(phpurl), body: {       
      "firstname": firstname,
      "lastname": lastname,
      "number":number,
      "password": password
    }); 

    if (res.statusCode == 200) {
      var data = json.decode(res.body); 
      if(data["error"]){
      setState(() { 
        sending = false;
        error = true;
        msg = data["message"]; 
      }); 
      }else{
          _firstname.text = "";
          _lastname.text = "";
          _mobile.text = "";
          _password.text = "";      
          setState(() {
            sending = false;
            success = true; 
          });
         
                      
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const MyApp())));
      }   
      
       
    }else{
      setState(() {
      error = true;
      msg = "Error during registering.";
      sending = false;    
    });
    }
  }

     Widget detailerrmsg(String text){

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
                ),
                
                Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
               
            ]),
        );
  } 
    Widget regfailedmsg(String text){
  
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
                ),
                
                Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
               
            ]),
        );
  } 
    Widget emptyfielderror(String text){
 
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
                ),
                
                Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
               
            ]),
        );
  } 
           
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
          ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.deepPurple])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Image(
                image: AssetImage('assets/images/PurpleLogo2.png'),
              ),
            ),
              Container( 
                         margin: EdgeInsets.only(top:30),
                         padding: EdgeInsets.all(10),
                         child:error? detailerrmsg(msg):Container(),
                        
                     ),
                        Container( 
                         margin: EdgeInsets.only(top:30),
                         padding: EdgeInsets.all(10),
                         child:error? regfailedmsg(msg):Container(),
                        
                     ),
                     Container( 
                         margin: EdgeInsets.only(top:30),
                         padding: EdgeInsets.all(10),
                         child:emptyfields? emptyfielderror("Please fill in all fields."):Container(),
                        
                     ),
          

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                controller: _firstname,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.red),
                  ),
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                onChanged: (value){
                              firstname = value;
                            },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                  child: TextField(
                    controller: _lastname,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                      ),
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    onChanged: (value){
                              lastname = value;
                            },
            ),),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                  child: TextField(
                    controller: _mobile,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                      ),
                      labelText: 'Mobile Number or Email',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    onChanged: (value){
                              number= value;
                            },
            ),),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                      ),
                      labelText: 'New Password',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    onChanged: (value){
                              password = value;
                            },
            ),),
             Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                  child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  text: "By clicking Sign Up, you agree to our Terms ",
                  style: TextStyle(color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms Data Privacy',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600)),
                    TextSpan(text: ' and '),
                    TextSpan(
                        text: 'Cookies Policy',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text:
                            '. You may receive SMS Notifications from us and can opt out any time.')
                  ]),
              ),
            ),
                      ElevatedButton(onPressed: () async{
 
                      if(_errorText ==true){
                          setState(() 
                        {
                          emptyfields=true;
                        }); 
                      }else
                      {
                        setState(() {
                          sending=true;
                        });
                        sendData();
           }
                       

                      }, child: Text(
                        sending?"Registering...":"Sign Up",
                        ),
                      )
          ],
        ),
      ),
    );
  }



}

