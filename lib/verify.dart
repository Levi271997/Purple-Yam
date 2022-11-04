import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _Verify();
}

class _Verify extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(widget.title),
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
            Text('Verify Your Account',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25.0,
              fontWeight: FontWeight.w700
              ),
            ),
            Text(
              'We sent a 6-digit code to your email address. Enter the code to verify your account.',
              textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14.0,
              fontWeight: FontWeight.w400
              ),
            ),
            TextField(
                textAlign: TextAlign.center,
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
                  hintText: 'Enter Code',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.all(20.0),
                ),
              ),
              TextButton.icon(
                   onPressed: () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: ((context) => const Verify())));
                },
                icon: Icon(Icons.send),
                label: Text('Send Email Again'),
                style: ButtonStyle(),),
                TextButton.icon(
                   onPressed: () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: ((context) => const Verify())));
                },
                icon: Icon(Icons.phone),
                label: Text('Get Code via SMS'),
                style: ButtonStyle(),)
          ],
        ),
      ),
    );
  }
}