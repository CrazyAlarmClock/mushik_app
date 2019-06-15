import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tests/card_page.dart';
import 'create_history.dart';
import 'model.dart';
import 'package:path/path.dart';
import 'main.dart';
import 'detali_page_myhistory.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List historyLocals;

  @override
  void initState() {
    historyLocals = getHistoryLocal();
    super.initState();
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
class MyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      ListTile makeListTile(HistoryLocal historyLocal) => ListTile(
        contentPadding:
        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.autorenew, color: Colors.white),
        ),
        title: Text(
          historyLocal.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        subtitle: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  // tag: 'hero',
                  child: Icon(Icons.date_range,color:Colors.grey),
                )),
            Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(historyLocal.date,
                      style: TextStyle(color: Colors.white))),
            )
          ],
        ),

        onTap: () {
          getHistoryLocal();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => detali_page_myhistory(historyLocal: historyLocal),
              ));
        },
      );
      Card makeCard(HistoryLocal historyLocal) => Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(historyLocal),
        ),
      );

      final makeBody = Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,

          itemCount:getHistoryLocal().length,
          itemBuilder: (BuildContext context, int index) {
            return makeCard(getHistoryLocal()[index]);
          },
        ),
      );
      return Scaffold(
    body: makeBody,
          floatingActionButton: new FloatingActionButton(
              onPressed: () =>  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>CrateHistory()),
              ),
              child: new Icon(Icons.add))
      );
  }
  }

List getHistoryLocal() {
  return historyLocals;
}



