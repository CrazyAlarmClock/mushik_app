import 'dart:html';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'menu_bar.dart';


class Story extends StatefulWidget {
  String title;
  bool agreement;
  String body;
  String token;
  String date;
  String avatar_color;
  int views;
  String nickname;

  Story({@required this.title, this.body, this.agreement, this.token, this.date, this.avatar_color, this.views, this.nickname});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<Story> {
  Firestore firestore = Firestore.instance;
  var doc = document.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black, onPressed: ()=> Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => MenuBar())),),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),

        body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                child: new ListTile(
                  leading: const Icon(
                    Icons.face,
                    color: Colors.blue,
                  ),
                  title: Text('Cоздатель истории', textScaleFactor: 1.2),
                  subtitle: Text(
                    widget.nickname,
                    textScaleFactor: 1.2,
                  ),
                ),
              ),
              Container(
                child: new ListTile(
                  leading: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.blue,
                  ),
                  title: Text('Просмотров', textScaleFactor: 1.2),
                  subtitle: Text(
                    widget.views.toString(),
                    textScaleFactor: 1.2,
                  ),
                ),
              ),
              Container(
                child: new ListTile(
                  leading: const Icon(
                    Icons.description,
                    color: Colors.blue,
                  ),
                  title: Text('Название', textScaleFactor: 1.2),
                  subtitle: Text(
                    widget.title,
                    textScaleFactor: 1.2,
                  ),
                ),
              ),
              Container(
                child: new ListTile(
                  leading: const Icon(
                    Icons.date_range,
                    color: Colors.blue,
                  ),
                  title: Text('Дата', textScaleFactor: 1.2),
                  subtitle: Text(
                    widget.date,
                    textScaleFactor: 1.2,
                  ),
                ),
              ),

              Container(
                child: new ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  title: Text('История', textScaleFactor: 1.2),
                  subtitle: Text(
                    widget.body,
                    textScaleFactor: 1.2,
                  ),
                ),
              ),
            ])));
  }
}
