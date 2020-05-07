import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushik/service/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
        ),

        debugShowCheckedModeBanner: false,
        home: AuthService().handleAuth()
    );
  }
}