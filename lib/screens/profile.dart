import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushik/main.dart';
import 'package:mushik/service/auth.dart';
import 'package:mushik/service/user_info.dart';




class Profile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(children: <Widget>[
         FlatButton(
           child: Text('exit'),
           onPressed: () {
             AuthService().signOut();
             Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context) => MyApp()));
           }),
       Text(Userinfo.Token)],),
    );
  }
}