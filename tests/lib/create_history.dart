import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_history.dart';
import 'model.dart';

String name_value = " ";
String history_value = " ";

void main() => runApp(CrateHistory());

class CrateHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Введите название исотрии'
                  ),
                  onChanged: (name){
                    name_value = name;

                  },
                ),
                width: 400.0,
              ),
              new Container(
                child:  TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Напишите вашу историю'
                  ),
                  onChanged: (history){
                    history_value= history;

                  },
                ),
                width: 400.0,
                height: 200.0,

                padding: new EdgeInsets.only(top: 10.0),


              ),
              new Padding(padding: new EdgeInsets.only(top:50.0),
              child: new MaterialButton(
                color: Colors.blue,
                  child:new Text("СОХРАНИТЬ"),
                  textColor: Colors.white,
                  onPressed: () => Navigator.pop(context,save()),
              ),
              ),
              new Container (
                child: new MaterialButton(
                  color: Colors.lightBlue,
                  child:new Text("ОТМЕНА"),
                  textColor: Colors.white,
                  onPressed: () => Navigator.pop(context)
                ),

              )
          ],

          ),
        ),
      ),
    );
  }
}



 void save() {
   historyLocals.add(HistoryLocal(id: historyLocals.length, name: name_value, description: history_value,date: "time"));

 }

