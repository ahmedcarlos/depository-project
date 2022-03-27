import 'package:flutter/material.dart';
class CustomersPage extends StatefulWidget {
  @override
  _CustomersPageState createState() => _CustomersPageState();
}
class _CustomersPageState extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    Color color=Color.fromRGBO(1, 168, 232, 1);
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    Color lightcolor=Color.fromRGBO(225, 245, 252, 1);

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [Padding(
          padding:  EdgeInsets.only(right:10.0),
          child:CircleAvatar(
            child: Icon(Icons.download,color: Colors.white,),
            backgroundColor: color,
          ),
        ),],
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
        title: Text('Customers',style: TextStyle(
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
                              hintText: 'Search for customers',
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
                  child:   ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context,int position){
                        return      Padding(
                          padding: EdgeInsets.only(top:10),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(width*.04),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top:width*.02,bottom: width*.02),
                                    child: Row(
                                      children: [
                                        Text('Name : ',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: width*.06),),
                                        Text('Ahmed Mohamed'),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top:width*.02,bottom: width*.02),
                                    child: Row(
                                      children: [
                                        Text('Email : ',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: width*.06)),
                                        Text('user@gamil.com'),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:width*.02,bottom: width*.02),
                                    child: Row(
                                      children: [
                                        Text('Address : ',style: TextStyle(color: color,fontWeight: FontWeight.bold,fontSize: width*.06)),
                                        Text('Khartoum,sudan'),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex:10,
                                        child: ElevatedButton.icon(
                                          onPressed: (){
                                            setState(() {
                                              editCustomer(context);
                                            });
                                          },
                                          icon: Icon(Icons.edit,color: color,),
                                          label: Text('Edit',style: TextStyle(color: Colors.pinkAccent[100]),),
                                          style:ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(lightcolor),
                                              elevation: MaterialStateProperty.all(1),
                                              side: MaterialStateProperty.all(BorderSide.none)
                                          ) ,
                                        ),
                                      ),
                                      Expanded(flex:1,child: Container()),
                                      Expanded(
                                        flex: 10,
                                        child: ElevatedButton.icon(
                                          onPressed: (){
                                            setState(() {
                                              delCustomer(context);
                                            });
                                          },
                                          icon:Icon(Icons.delete,color: color,),
                                          label: Text('Delete',style: TextStyle(color: Colors.pinkAccent[100]),),
                                          style:ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(lightcolor),
                                            elevation: MaterialStateProperty.all(1),
                                          ) ,
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
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
            addCustomer(context);
          });
        },
        tooltip: 'add Customer',
        child: Icon(Icons.add),
        backgroundColor: color,
      ),

    );
  }
  static void delCustomer(context) {
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
                    Text('delete this Customer',style: TextStyle(
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
  static void addCustomer(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // titlePadding: EdgeInsets.all(0),
            title: Text("add new Customer"),
            content:Container(
              width: double.minPositive,
              height: 150,
              child: ListView(children: [
                TextField(decoration: InputDecoration(hintText: "Customer name"),),
                TextField(decoration: InputDecoration(hintText: "Customer Email"),),
                TextField(decoration: InputDecoration(hintText: "Customer Address"),),

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
  static void editCustomer(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController nameController = TextEditingController()..text = 'Ahmed Mohamed';
          TextEditingController emailController = TextEditingController()..text = 'user@gmail.com';
          TextEditingController addressController = TextEditingController()..text = 'Khartoum,Sudan';
          return AlertDialog(
            // titlePadding: EdgeInsets.all(0),
            title: Text("Edit Customer"),
            content:Container(
              width: double.maxFinite,
              height: 200,
              child: ListView(children: [
                TextField(controller:nameController, decoration: InputDecoration(hintText: "Customer name",label: Text('Customer name')),),
                TextField(controller:emailController,decoration: InputDecoration(hintText: "Customer Email",label: Text('Customer email')),),
                TextField(controller:addressController,decoration: InputDecoration(hintText: "Customer Address",label: Text('Customer address')),),

              ],),
            ),
            actions: <Widget>[
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text('cancel')),
              ElevatedButton(onPressed: (){
              }, child: Text('Edit')),
            ],
          );
        }
    );
  }
}
