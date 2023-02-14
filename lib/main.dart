import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ToDoListApp(),
    );
  }
}

class dataObject {
  String name;
  String mobile;
  String email;
  dataObject({required this.name, required this.mobile,required this.email});
}

class ToDoListApp extends StatefulWidget {
  const ToDoListApp({Key? key}) : super(key: key);

  @override
  State<ToDoListApp> createState() => _ToDoListAppState();
}

class _ToDoListAppState extends State<ToDoListApp> {
  List<dataObject> todolist = [];
  TextEditingController username = TextEditingController();
  TextEditingController userMobile = TextEditingController();
  TextEditingController userEmail = TextEditingController();

  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Profile List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context){
            return Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                    child: Text(
                      'Add New Customer Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16,
                      ),
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username", //babel text
                          hintText: "Enter your email", //hint text
                          prefixIcon: Icon(Icons.people), //prefix iocn
                          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                          labelStyle: TextStyle(fontSize: 13, color: Colors.green), //label style
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: userMobile,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Mobile number", //babel text
                          hintText: "Enter mobile number", //hint text
                          prefixIcon: Icon(Icons.phone), //prefix iocn
                          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                          labelStyle: TextStyle(fontSize: 13, color: Colors.green), //label style
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: userEmail,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email", //babel text
                          hintText: "Enter email address", //hint text
                          prefixIcon: Icon(Icons.email), //prefix iocn
                          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                          labelStyle: TextStyle(fontSize: 13, color: Colors.green), //label style
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      dataObject newObject = new dataObject(
                          name: username.text,
                          mobile: userMobile.text,
                          email: userEmail.text
                      );
                      todolist.add(newObject);
                      setState(() {});
                      Navigator.pop(context);
                      username.clear();
                      userMobile.clear();
                      userEmail.clear();
                    }, child: Text('Add New Profile'))
                  ],
                ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context,index){
            return Card(
              child:ListTile(
                leading: Icon(Icons.person),
                title: Text(todolist[index].name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todolist[index].mobile),
                    Text(todolist[index].email),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
            );
          }
      ),
    );
  }
}

