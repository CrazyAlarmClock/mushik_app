import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tests/Login_Activity.dart';
import 'package:flutter/material.dart';
import 'auth/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'home_page.dart';



class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    text: "awawd"
                ),
              ),
              RaisedButton(
                  child: Text('ВЫЙТИ'),
                  onPressed: null
              ),
            ],
          )
      ), //center
    );
  }


}