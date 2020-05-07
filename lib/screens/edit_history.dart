
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushik/service/user_info.dart';

import 'menu_bar.dart';

class EditHistory extends StatefulWidget {
  String body;
  String title;
  String id;
  bool  agreement;


  EditHistory({@required this.title, this.body, this.agreement, this.id});

  @override
  _EditHistoryPageState createState() => _EditHistoryPageState();
}

class _EditHistoryPageState extends State<EditHistory> {


  bool _agreement = false;
  Firestore firestore = Firestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,

        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await firestore.collection('stories').document().updateData({
                'title': widget.title,
                'body':widget.body,
                'agreement': _agreement,
                'token': Userinfo.Token,

          });


            SnackBar(content: Text('История сохранена',style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,);
            BackButton(color: Colors.black, onPressed: ()=> Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MenuBar())));        // Add your onPressed code here!
          },
          label: Text('Сохранить изменения'),
          icon: Icon(Icons.check),
          backgroundColor: Colors.blue,
        ),
        body: Column(

          children: <Widget>[
            SizedBox(height: 40,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                initialValue: widget.title,

                maxLines: null,
                autofocus: false,

                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Название'),
                onChanged: (title) {
                  widget.title = title;
                },
              ),
            ),
            SizedBox(height: 40,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),

              child: TextFormField(
                initialValue: widget.body,
                maxLines: null,
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Моя история'
                ),
                onChanged: (body) {
                  widget.body = body;
                },
              ),

            ),
            new Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CheckboxListTile(
                    activeColor: Colors.blue,
                    value: _agreement,
                    title: Text('Опубликовать вашу историю?'),
                    onChanged: (bool value) =>
                        setState(() => _agreement = value))),


          ],
        )

    );
  }
}
