import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Retrieve extends StatefulWidget {
  @override
  _RetrieveState createState() => _RetrieveState();
}

class _RetrieveState extends State<Retrieve> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshots){

            if (snapshots.connectionState==ConnectionState.waiting){
              return Center(child: Text('Loading..'));
            }

            if (snapshots.data==null || snapshots.data.documents.length==0){
              return Center(child: Text('No data yet'));
            }

            var user = snapshots.data.documents;

            return ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      ListTile(
                        leading: Text(user[index].data()['email']),
                        trailing: Text(user[index].data()['pass']),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.black,
                      )
                    ],
                  );
                });
          },
        )));
  }
}
