import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'home.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  Image image =Image.asset('images/zitalogo.png');

  //orange color
  Color lightColor=Color.fromRGBO(225, 245, 252, 1);
  Color color=Color.fromRGBO(1, 168, 232, 1);

  //   /toggle show and not show the password
  bool toggle1 =true;
  Icon icon1=Icon(Icons.visibility,color:Color.fromRGBO(1, 168, 232, 1));
  //Controller of all text field to validator on submit
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  //index of bottomNavigationBar
  var value=0;
  // GlobalKey of form
  var _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  bool loading = false;
  var data = {
    "phone": "",
    "password": ""
  };
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  WillPopScope(
      // ignore: missing_return
      onWillPop: (){
        if (Platform.isAndroid) {
          exitApp(context);
        }
      },
      child: Scaffold(
        key: _scaffold,
        backgroundColor: Colors.white,
        body: Container(
          width: width,
          height: height,
          child: Padding(
            padding: EdgeInsets.only(left: width*.06,right:width*.06,top: height*.08),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  // the title
                  Container(
                    padding: EdgeInsets.only(right: width*.14,left:width*.14),
                    child: Center(
                      child: image,
                    ),
                  ),
                  ////////
                  SizedBox(
                    height: height*.05,
                  ),
                  //////////
                  ClipRRect(
                    borderRadius: BorderRadius.circular(17.5),
                    child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please Enter your username or ID';
                            }
                          },
                          controller: usernameController,
                          decoration: InputDecoration(
filled: true,
                              fillColor: lightColor,
                              hintText: 'username or ID',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,)),
                        )
                    ),
                  ),
                  /////////////////
                  SizedBox(height: height*.035,
                  ),
                  ////////////
                  //password TextField
                  ClipRRect(
                    borderRadius: BorderRadius.circular(17.5),
                    child: Center(
                        child: TextFormField(

                          obscureText: toggle1,
                          controller: passwordController,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty ||
                                passwordController.text.length < 8) {
                              return 'please Enter your password 8 letter or more';
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: icon1,
                                onPressed: (){
                                  setState(() {
                                    togglePassword1();
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: lightColor,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,)),
                        )),
                  ),
                  SizedBox(height: height*.035,),
                  /////////////////////
                  // the validate Button
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        padding: EdgeInsets.only(top: height*.015,bottom: height*.015),
                        color: color,
                        textColor: Colors.white,
                        child:  Text(
                          'Log In',

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: width*.095),
                        ),
                        elevation: 1,
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>HomePage(),));

                            }
                          });
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  /*to toggle show and not show the password*/
  void togglePassword1() {
    if (toggle1) {
      toggle1 = false;
      icon1 = Icon(Icons.visibility_off,color: color,);
    } else {
      toggle1 = true;
      icon1 = Icon(Icons.visibility,color: color,);
    }
  }
  static void exitApp(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.all(0),
            title: Text("Exit App"),
            content: Text("Are you sure you want to exit app"),
            actions: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text('cancel')),
              ElevatedButton(onPressed: (){
               exitApp(context);
              }, child: Text('yes')),
            ],
          );

        }
    );
  }
}