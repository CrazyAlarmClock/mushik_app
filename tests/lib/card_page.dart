import 'package:flutter/material.dart';
import 'model.dart';
import 'my_card.dart';
import 'text_style.dart';

class DetailPage extends StatelessWidget {

  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFFfffffff),
        child: new Stack (
          children: <Widget>[
            //_getBackground(),
            //_getGradient(),

            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }
 Container _getToolbar(BuildContext context) {
    return new Container(
            margin: new EdgeInsets.only(
            top: MediaQuery
                    .of(context)
                    .padding
                    .top),
            child: new BackButton(color: Colors.black),
          );
   }



  Widget _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new ListView(
      padding: new EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
      children: <Widget>[
        new PlanetRow(planet, horizontal: false,),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_overviewTitle, style: Style.headerTextStyle,),
                      new Separator(),

              new Text(planet.description, style: Style.commonTextStyle),
            ],
          ),
        ),
      ],

    );
  }
}
class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 8.0),
        height: 2.0,
        width: 18.0,
        color: new Color(0xff00c6ff)
    );
   }
 }