
import 'package:flutter/material.dart';
import 'package:mushik/service/auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'edit_history.dart';
import 'home_screen.dart';

class MyStory extends StatefulWidget {
  String title;
  bool agreement;
  String body;
  String token;
  String date;
  int views;
  String id;

  MyStory({@required this.title, this.body, this.agreement, this.token, this.date, this.views, this.id});

  @override
  _MyStoryPageState createState() => _MyStoryPageState();
}

class _MyStoryPageState extends State<MyStory> {
  Firestore firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){ Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => EditHistory(id: widget.id, body: widget.body, title: widget.title,)));},
        icon: Icon(Icons.create),
        label: Text('изменить историю'),
        backgroundColor: Colors.blue,
      ),
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),

        body: Container(
            child: Column(children: <Widget>[
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
                    widget.title,
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
                  title: Text('Просмотры', textScaleFactor: 1.2),
                  subtitle: Text(
                    widget.views.toString(),
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
              FlatButton.icon(onPressed:() => Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => EditHistory(id: widget.id, body: widget.body, title: widget.title,))), icon: Icon(Icons.create), label: Text("Изменить истоию") )
        ])),

    );
  }
}
