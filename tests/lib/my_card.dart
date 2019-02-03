import 'package:flutter/material.dart';

import 'model.dart';
import 'text_style.dart';
import 'card_page.dart';
/// аахахахахахахахахахаахахахахахахахахахахах
class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new ListView.builder(
          itemBuilder: (context, index) => new PlanetRow(planets[index]),
          itemCount: planets.length,
          padding: new EdgeInsets.symmetric(vertical: 50.0)),
    );
  }
}

class PlanetRow extends StatelessWidget {
  final Planet planet;
  final bool horizontal;
  PlanetRow(this.planet, {this.horizontal = true});
  PlanetRow.vertical(this.planet): horizontal = false;



  @override
  Widget build(BuildContext context) {

    Widget _planetValue({String value, String image}) {
      return new Row(children: <Widget>[
        new Image.asset(image, height: 20.0),
        new Container(width: 8.0),
        new Text(planet.gravity, style: Style.smallTextStyle,
        ),
      ]);
    }

    final planetCardContent = new Container(
      //margin: new EdgeInsets.fromLTRB(100.0, 16.0, 16.0, 16.0),
      margin: new EdgeInsets.fromLTRB(horizontal ? 110.0 : 24.0, horizontal ? 16.0 : 144.0, 24.0, 25.0), ////// fffffffff

        constraints: new BoxConstraints.expand(),
      child: new Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
       crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 6.0),
          new Text(planet.name, style: Style.headerTextStyle,
          ),
          new Container(height: 20.0),
          new Text(
            planet.location, style: Style.commonTextStyle,
          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)), ///////////////////////////
          new Row(
            children: <Widget>[
//              new Expanded(
//                  child: _planetValue(
//                      value: planet.distance, image: "images/mars.png")),
              new Expanded(
                 flex: horizontal ? 1 : 0,
                  child: _planetValue(value: planet.gravity, image: "images/mars.png"))
            ],
          ),
        ],
      ),
    );

    final planetCard = new Container(

//      height: 124.0,
//      margin: new EdgeInsets.only(left: 46.0),
        height: horizontal ? 200.0 : 0.0,
          margin: horizontal ? new EdgeInsets.only(left: 46.0) : new EdgeInsets.only(bottom: 0.0),
      decoration: new BoxDecoration(
        color: new Color(0xFFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),

        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0,
            offset: new Offset(0.0, 0.0),
          ),
        ],
      ),
    );

    final planetThumbnail = new Container( // картинка
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.topCenter,
      //alignment: FractionalOffset.centerLeft,
      child: new Hero(
        tag: "planet-hero-${planet.id}",
        child: new Image(
          image: new AssetImage(planet.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    return new GestureDetector(
//        onTap: () => Navigator.of(context).push(new PageRouteBuilder(
//              pageBuilder: (_, __, ___) => new DetailPage(planet),
//            )),
        onTap: horizontal
          ? () => Navigator.of(context).push(
            new PageRouteBuilder(pageBuilder: (_, __, ___) => new DetailPage(planet),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => new FadeTransition(opacity: animation, child: child),
          ) ,
        ) : null,
        child: new Container(
            height: 150.0,
            margin: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 12.0,
            ),
            child: new Stack(
              children: <Widget>[
                planetCard,
                planetThumbnail,
                planetCardContent
              ],
            )));
  }
}
