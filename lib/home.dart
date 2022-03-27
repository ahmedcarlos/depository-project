import 'package:flutter/material.dart';
import 'package:zita_project/customers.dart';
import 'package:zita_project/trainees.dart';
import 'package:zita_project/depository.dart';
import 'dart:io' show Platform;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Color color=Color.fromRGBO(1, 168, 232, 1);
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    Image image =Image.asset('images/zitalogo.png',);
    Image userIcon =Image.asset('images/Users.png',);
    Image traineesIcon =Image.asset('images/trainees.png');
    Image depositoryIcon =Image.asset('images/Opened Folder.png');
    Color lightcolor=Color.fromRGBO(225, 245, 252, 1);
    return  WillPopScope(
      // ignore: missing_return
      onWillPop: (){
      if (Platform.isAndroid) {
        exitApp(context);
      }
    },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              addEmployee(context);
            });
          },
          tooltip: 'add Employee',
          child: Icon(Icons.add),
          backgroundColor: color,
        ),
        body: Container(
          width: width,
          height: height,
          child: Padding(
            padding: EdgeInsets.only(left: width*.05,right:width*.05,top: height*.05,bottom:height*.05),
              child: ListView(
                children: <Widget>[
                  // the title
                  Container(
                    width: width,
                    height: height*.15,
                    child: Center(
                      child: image,
                    ),
                  ),
                  ////////////////////
                  SizedBox(
                    height: height*.05,
                  ),
                  ///////////////
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>CustomersPage(),));

                      });
                    },
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(17.5),
                          child: Container(
                            color:color,
                            padding:EdgeInsets.only(
                              top: height*.04,
                              bottom: height*.04,
                            ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CircleAvatar(
                                      child: userIcon,
                                      backgroundColor: lightcolor,
                                      radius: width*.065,
                                    ) ,
                          ),
                                  Expanded(
                                      flex: 7,
                                      child: Text('Customers',style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width*.07,
                                      ),),
                                  ),
                                ],
                              ),

                          )
                      ),
                    ),
                  ),
                  /////////////////
                  SizedBox(
                    height: height*.05,
                  ),
                  /////////////
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>TraineesPage(),));

                      });
                    },
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(17.5),
                          child: Container(
                            color: color,
                            padding:EdgeInsets.only(
                              top: height*.04,
                              bottom: height*.04,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: CircleAvatar(
                                    child: traineesIcon,
                                    backgroundColor:lightcolor,
                                    radius: width*.065,
                                  ) ,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Text('Trainees',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width*.07,
                                  ),),
                                ),
                              ],
                            ),

                          )
                      ),
                    ),
                  ),
                  //////////////////////////
                  SizedBox(
                    height: height*.05,
                  ),
                  /////////////
                  GestureDetector(

                      onTap: (){
          setState(() {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>DepositoryPage(),));

          });
          },
                    child: Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(17.5),
                          child: Container(
                            color: color,
                            padding:EdgeInsets.only(
                              top: height*.04,
                              bottom: height*.04,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: CircleAvatar(
                                    child: depositoryIcon,
                                    backgroundColor: lightcolor,
                                    radius: width*.065,
                                  ) ,
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Text('Depository',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: width*.07,
                                  ),),
                                ),
                              ],
                            ),

                          )
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
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
  static void addEmployee(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.all(0),
            title: Text("add new Employee"),
            content:Container(
              width: double.minPositive,
              height: 150,
              child: ListView(children: [
                TextField(decoration: InputDecoration(hintText: "Employee name"),),
                TextField(decoration: InputDecoration(hintText: "Employee Password"),),

              ],),
            ),
            actions: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text('cancel')),
              ElevatedButton(onPressed: (){
              }, child: Text('Save')),
            ],
          );
        }
    );
  }
}