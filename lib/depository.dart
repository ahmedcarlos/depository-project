import 'package:flutter/material.dart';
import 'package:zita_project/project_files.dart';
class DepositoryPage extends StatefulWidget {
  @override
  _DepositoryPageState createState() => _DepositoryPageState();
}
class _DepositoryPageState extends State<DepositoryPage> {
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
        title: Text('Depository',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width*.1,
            color: color
        ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.only(left: width*.04,right:width*.04,top: height*.02,bottom:height*.02),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(17.5),
                    child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              suffixIcon: ClipRRect(
                                borderRadius: BorderRadius.circular(17.5),
                                child: Container(
                                  child:Icon(Icons.search,color: Colors.white,),
                                  color: color,
                                ),
                              ),
                              filled: true,
                              fillColor: lightcolor,
                              hintText: 'search  for project',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              )),
                        )
                    ),
                  ),
                ],
              ),

              Expanded(
                flex: 7,
                child:   GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context,int position){
                      return      Padding(
                        padding: EdgeInsets.only(top:20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17.5),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>ProjectFilesPage(),));

                              });
                            },
                            child: Container(
        color: color,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Positioned(
                                    top: 7,
                                    right: 7,
                                    child: CircleAvatar(child: Icon(Icons.arrow_downward,color: color,size: 20,),
                                      backgroundColor: Colors.white,
                                      radius: 15,
                                  ),
                                  ),
                                  Positioned(
                                    top: 15,
                                    child: Column(
                                      children: [
                                        CircleAvatar(child: Icon(Icons.folder_rounded,color: color,size: 40,),
                                          backgroundColor: lightcolor,
                                          radius: 35,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('project name',style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      );

                    }//end item
                ),),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
             addProject(context);
          });
        },
        tooltip: 'add project',
        child: Icon(Icons.add),
        backgroundColor: color,
      ),
    );
  }
  static void addProject(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.all(0),
            title: Text("add new Project"),
            content: TextField(
              decoration: InputDecoration(hintText: "Project name"),
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
