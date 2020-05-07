import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mushik/screens/add_history.dart';
import 'package:mushik/screens/my_story.dart';
import 'package:mushik/service/auth.dart';
import 'package:mushik/service/user_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_screen.dart';

class MyTaskPage extends StatefulWidget {
  @override
  _MyTaskPageState createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {

  @override
  void initState() {

    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
      Userinfo.Token = user.uid;
      Userinfo.Email = user.email;
    })
        : null);

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('stories').where('token', isEqualTo: Userinfo.Token).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new CircularProgressIndicator();
                  default:
                    return new ListView(
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new CustomCard(
                     document: document,
                        );
                      }).toList(),
                    );
                }
              },
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddHistory()));
          // Add your onPressed code here!
        },
        label: Text('Написать историю'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class MyCustomCard extends StatelessWidget {
  MyCustomCard({@required this.document});

  final  DocumentSnapshot document;



  @override
  Widget build(BuildContext context) {
    return Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyStory(views: document['number_of_views'] ,title: document['title'],token: document['token'],agreement: document['agreement'], body: document['body'], date: document['date'], id:document.documentID )),
        );
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 2.0),
            child: Text(
              document['title'] ?? 'le',
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 2.0),
            child: Text(
              document['date']?? 'le',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontSize: 16.0, color: Colors.grey),
            ),
          ),
          SizedBox(height: 15),
        ],
      )));
    }
  }

