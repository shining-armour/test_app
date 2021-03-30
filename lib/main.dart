import 'package:flutter/material.dart';
import 'package:flutter_test_app/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_test_app/user.dart';
import 'package:flutter_test_app/retrieve.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: First(),
    );
  }
}

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  var name = 'elephant';
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  User user = User();
  Uuid uuid = Uuid();

  void addToDB(User user) async{
    await FirebaseFirestore.instance.collection('users').doc(uuid.v1()).set(user.toMap(user));
  }

  void edituserinfo(String updatedemail) async{
    await FirebaseFirestore.instance.collection('users').doc('2cb40c70-9115-11eb-b833-d92a0b027f3a').update({'email': updatedemail});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lime, title: Text('app'), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Container(
          child: Column(
            children: [
              Text('Email'),
              TextField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )
                ),
              ),
              SizedBox(height: 10.0,),
              Text('Password'),
              TextField(
                controller: _passcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
              SizedBox(height: 10.0,),
              TextButton(
                  onPressed: () {
                    if (_emailcontroller.text.isNotEmpty && _passcontroller.text.isNotEmpty) {
                      user = User(
                        email: _emailcontroller.text,
                        pass: _passcontroller.text,
                      );
                      addToDB(user);
                    } else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 2),
                        content: Text('Error',),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: Text('Click me'),
                  ),
              SizedBox(height:10.0),
              Text(name),
              TextButton(
                onPressed: (){
                  setState(() {
                    name = 'octopus';
                  });
                  print(width);
                  print(height);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Retrieve()));
                },
                child: Text('Change the word'),
              ),
              SizedBox(height:10.0),
              TextButton(
                child: Text('edit'),
                onPressed: ()=>edituserinfo('GFH'),
              )
            ],
          ),
        ),
      ),
    );
  }
}



