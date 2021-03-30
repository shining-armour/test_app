import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lime, title: Text('page 2'), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
        child: Container(
          child: Column(
            children: [
              Text('Email'),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Password'),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )
                ),
              ),
              SizedBox(height: 50.0,),
              TextButton(
                onPressed: (){Navigator.pop(context);},
                child: Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}