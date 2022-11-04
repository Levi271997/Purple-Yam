import 'dart:convert';
//import 'dart:html';
//import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
//import 'package:numberpicker/numberpicker.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'dart:developer' as dev;




class advars extends StatefulWidget {
  const advars({super.key});

  @override
  State<advars> createState() => _advarsState();
}

class PhotoItem {
  final String image;
  final String name;
  PhotoItem(this.image, this.name);
}

class _advarsState extends State<advars> {
  List<File> variantimages = [];
  // List<Asset> images = <Asset>[];

  TextEditingController _variantname=new TextEditingController();
  TextEditingController _variantDesc = new TextEditingController();
   TextEditingController _variantprice= new TextEditingController();
  late bool error,emptyfields, sending, success,showprogress;
  late String message, varname,vardesc,varprice;
  late String errormsg;
  
  
 
  XFile? image;
 List _images = [];
  final ImagePicker picker = ImagePicker();

 

Future _imageFromCamera(int index) async {
     XFile? varimage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      variantimages.insert(index, File(varimage!.path));
      //variantimages.removeAt(index + 1);
    });
  }
  Future _imageFromGallery(int index) async {
    XFile? varimage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      variantimages.insert(index, File(varimage!.path));
      //variantimages.removeAt(index + 1);
    });
    dev.log('$variantimages');
  }


bool? get _errorText{
    final variantname=_variantname.value.text;
    final variantdesc= _variantDesc.value.text;
    var fieldsvalidateempty=false;
    if(variantname.isEmpty || variantdesc.isEmpty){
      fieldsvalidateempty=true;
      return fieldsvalidateempty;
    }else{
      return fieldsvalidateempty;
    }
  }
Future sendImages() async{
  var url="http://192.168.0.108/purple_yam/addproducts.php";
var response = await http.post(Uri.parse(url), body: {  
        'images': variantimages, 
        
});
}

Future AddVariant() async{
  String vprice=varprice.toString();
  double itemprice = double.parse(vprice);
  // var img = await picker.pickImage(source: media);
   var uri = "http://192.168.0.108/purple_yam/addproducts.php";
    var response = await http.post(Uri.parse(uri), body: {  
        'variantname': varname, 
        'variantdesc': vardesc ,
        'variantprice':varprice
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
          _variantname.text="";
          _variantDesc.text="";
          _variantprice.text="";
            if(jsondata["success"]){
               setState(() {
                emptyfields=false;
                success=true;
                  error = false;
                  showprogress = false;
                  message=jsondata["message"];
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
    emptyfields=false;
    error = false;
    sending = false;
    success = false;
    message = "";
    showprogress=false;
    super.initState();
}
//  void myAlert() {
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 shape:
//                     RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                 title: Text('Please choose media to select'),
//                 content: Container(
//                   height: MediaQuery.of(context).size.height / 6,
//                   child: Column(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           AddVariant(ImageSource.gallery);
//                         },
//                         child: Row(
//                           children: [
//                             Icon(Icons.image),
//                             Text('From Gallery'),
//                           ],
//                         ),
//                       ),
//                       ElevatedButton(
//                         //if user click this button. user can upload image from camera
//                         onPressed: () {
//                           Navigator.pop(context);
//                           AddVariant(ImageSource.camera);
//                         },
//                         child: Row(
//                           children: [
//                             Icon(Icons.camera),
//                             Text('From Camera'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             });
//       }
// Future getImageServer()async{
//    try{
    
//           final response = await http.get(Uri.parse('http://192.168.0.101/purple_yam/addproducts.php'));
    
//           if(response.statusCode == 200){
//             final data = jsonDecode(response.body);
    
//             setState(() {
//               _images = data;
//             });
//           }
    
//         }catch(e){
    
//           print(e);
          
//         }
// }
 Widget emptyfieldserror(String text){

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

  Widget registrationsuccess(String text){

        return Container(
            padding: EdgeInsets.all(15.00),
            margin: EdgeInsets.only(bottom: 10.00),
            decoration: BoxDecoration( 
               borderRadius: BorderRadius.circular(30),
               color: Colors.green,
               border: Border.all(color:Color.fromARGB(255, 1, 252, 105), width:2)
            ),
            child: Row(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right:6.00),
                    child: Icon(Icons.check, color: Colors.white),
                ),
                Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),     
            ]),
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            end:Alignment.bottomCenter,
            stops: [0,1],
            colors: [Colors.white,
            Colors.purple,],
          )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Container( 
                         margin: EdgeInsets.only(top:30),
                         padding: EdgeInsets.all(10),
                         child:emptyfields? emptyfieldserror("Please fill in all required fields"):Container(),
                        
            ),
            Container( 
                      
                         padding: EdgeInsets.all(5),
                         child:success?  registrationsuccess(message):Container(),
                         
                        
                        
            ),
            Container(
              width: 250,
              height: 50,
              child: TextField(
                controller: _variantname,
                textAlign: TextAlign.left,
                 decoration: InputDecoration( enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red)
                              ),
                               labelText: 'Name',
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
                              varname=value;
                            },
              ),
            ),


             Container(
              width: 200,
              
              child: TextField(
                controller: _variantDesc,
                textAlign: TextAlign.left,
                 decoration: InputDecoration( enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red)
                              ),
                               labelText: 'Description',
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
                              vardesc=value;
                            },
              ),
            ),

             Container(
              width: 250,
              child: TextField(
                controller: _variantprice,
                textAlign: TextAlign.left,
              keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                ],
                 decoration: InputDecoration( enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.deepPurple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red)
                              ),
                               labelText: 'Price',
                              labelStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.all(20.0),
                              prefixIcon: Align(
                                widthFactor: 1.0,
                                heightFactor: 1.0,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                           onChanged: (value){
                              varprice = value;
                           },
              ),
            ),

Container(
   child:ElevatedButton(onPressed: () async{
 
                      if(_errorText ==true){
                          setState(() 
                        {
                          emptyfields=true;
                          success=false;
                        }); 
                      }else
                      {
                        setState(() {
                          showprogress=true;
                        });
                        AddVariant();
                      }                    
                      }, child: Text(
                        sending?"Registering new item...":"Save item",
                        ),
                      )
            ),
           
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          shrinkWrap: true,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _showPicker(context,0);
                                });
                              },
                              child: variantimages.isNotEmpty
                              ? Container(
                                child: Image.file(
                                  variantimages[0],
                                  width:100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                              :Container(
                                decoration: BoxDecoration(
                                  color:Colors.black12,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color:Colors.black,
                                  size: 30.0,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _showPicker(context,1);
                                });
                              },
                               child: variantimages.length > 1
                          ? Container(
                        child: Image.file(
                          variantimages[1],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                      :Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                            ),
 GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPicker(context, 2);
                        });
                        
                      },
                      child: variantimages.length > 2
                          ? Container(
                        child: Image.file(
                          variantimages[2],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                          :Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPicker(context, 3);
                        });
                        
                      },
                      child: variantimages.length > 3
                          ? Container(
                        child: Image.file(
                          variantimages[3],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                          :Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPicker(context, 4);
                        });
                        
                      },
                      child: variantimages.length > 4
                          ? Container(
                        child: Image.file(
                          variantimages[4],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                          :Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPicker(context, 5);
                        });
                        
                      },
                      child: variantimages.length > 5
                          ? Container(
                        child: Image.file(
                          variantimages[5],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                          :Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),


                          ],
                          
                          ),
                      )
                    ],
                  ),
                ),
              
              ),
            )

            // Container(
            //   height: 450,
            //   width: double.infinity,
            //  color: Colors.red,
              
            //   child:GridView.builder(
                
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisSpacing: 0,
            //     mainAxisSpacing: 0,
            //     crossAxisCount: 3,
            //   ),
            //      itemCount: _items.length,
            //      itemBuilder: (BuildContext context, index) {
            //          return Container(
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         color: Colors.amber,
            //         borderRadius: BorderRadius.circular(15)),
               
            //   );
            //      },
            //   ),
            // )
            



        ]
        ),
       )

    );
  }
  _showPicker(context,int index){
    showModalBottomSheet(
      context: context,
       builder: (BuildContext bc){
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title:Text('Photo Library'),
                  onTap: ()async{
                    _imageFromGallery(index);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: (){
                    _imageFromCamera(index);
                    Navigator.of(context).pop();
                  },
                )
              ],
             ),
          )
          );
       }
       );
  }
}