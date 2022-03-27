import 'package:flutter/material.dart';
class ProjectFilesPage extends StatefulWidget {
  @override
  _ProjectFilesPageState createState() => _ProjectFilesPageState();
}
class _ProjectFilesPageState extends State<ProjectFilesPage> {
  @override
  Widget build(BuildContext context) {
    Color color=Color.fromRGBO(1, 168, 232, 1);
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    Color lightcolor=Color.fromRGBO(225, 245, 252, 1);
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: .3,
        leadingWidth: 45,
        leading: GestureDetector(
          onTap: () => setState(() {
            Navigator.of(context).pop();
          }),
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: CircleAvatar(
              child: Icon(Icons.arrow_back,color: Colors.white,),
              backgroundColor: color,
            ),
          ),
        ) ,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Project name',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width*.1,
            color: color
        ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        color: color,
        child: Padding(
          padding: EdgeInsets.only(left: width*.04,right:width*.04,top: height*.02,bottom:height*.02),
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context,int position){
                return      Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Container(
                    color: lightcolor,
                    child: ListTile(
                      title: Text('folder name',style: TextStyle(
                        fontSize: width*.09
                            ,color: color
                      ),),
                      trailing: IconButton(
                          onPressed: (){setState(() {
                            delFile(context);
                          });},
                          icon: Icon(Icons.delete,color: Colors.pinkAccent[100],)),
                    ),
                  )
                );

              }//end item
          ),
        ),
      ),
    );
  }
  static void delFile(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.all(0),
            content:Container(
                width: double.minPositive,
                height: 50,
                child: Column(
                  children: [
                    Text('Are you sure you want to ',style: TextStyle(
                      fontSize: 20,
                    ),),
                    Text('delete this folder',style: TextStyle(
                      fontSize: 20,
                    ),),
                  ],
                )),
            actions: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text('No')),
              ElevatedButton(onPressed: (){
              }, child: Text('Yes')),
            ],
          );
        }
    );
  }
}
