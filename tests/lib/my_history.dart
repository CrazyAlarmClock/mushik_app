import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: new PageView(
            children: <Widget>[
              new Column(
                children: <Widget>[makeCard,makeCard2,makeCard3,makeCard4,makeCard5],
              ),
            ],
        ),
         floatingActionButton: new FloatingActionButton(
         onPressed: () => lol,
    child: new Icon(Icons.add))
     );
  }

}
final makeCard = Card(
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 10),
  ),
);

final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
    );





final makeCard2 = Card(
  elevation: 3.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .0)),
    child: makeListTile2,
  ),
);

final makeListTile2 = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    onTap: () => lol,
    leading: Container(
      padding: EdgeInsets.only(right: 2.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.grey),
    ),
    title: Text(
      "Как я помог бабуле",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Icon(Icons.date_range, color: Colors.blueAccent),
        Text(" 22.12.2018", style: TextStyle(color: Colors.black))
      ],
    ));

final makeCard3 = Card(
  elevation: 3.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .0)),
    child: makeListTile3,
  ),

);

final makeListTile3 = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(

      padding: EdgeInsets.only(right: 2.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.check, color: Colors.grey),
    ),
    title: Text(
      "Мой друг",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Icon(Icons.date_range, color: Colors.blueAccent),
        Text(" 25.11.2018", style: TextStyle(color: Colors.black))
      ],

    ),
    trailing:  Icon(Icons.favorite, color: Colors.grey, size: 30.0),
);

final makeCard4 = Card(
  elevation: 3.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .0)),
    child: makeListTile4,
  ),
);

final makeListTile4 = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 2.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.check, color: Colors.grey),
    ),
    title: Text(
      "Мой друг",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Icon(Icons.date_range, color: Colors.blueAccent),
        Text(" 25.11.2018", style: TextStyle(color: Colors.black))
      ],
    ));

final makeCard5 = Card(
  elevation: 3.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .0)),
    child: makeListTile5,
  ),
);

final makeListTile5 = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 2.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.check, color: Colors.grey),
    ),
    title: Text(
      "Мой друг",
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Icon(Icons.date_range, color: Colors.blueAccent),
        Text(" 25.11.2018", style: TextStyle(color: Colors.black))
      ],
    ));

void lol(){
  Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
