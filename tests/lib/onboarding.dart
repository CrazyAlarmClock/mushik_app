import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';






import 'main.dart';

class OnBoarding extends StatelessWidget {

  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
        pageColor: const Color(0xffEF5350),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Icon(Icons.format_align_justify),
        body: Text(
          'Тут ты можешь посмотреть на достижения в добрых делах у других лбюдей',
        ),
        title: Text(
          'Новости',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bubbleBackgroundColor: Colors.white,
        iconColor: Colors.white,
        mainImage: Image.asset(
          'images/news.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),

    PageViewModel(
        pageColor: const Color(0xff2979FF),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Icon(Icons.edit),
        body: Text(
          'Тут ты можешь записывать свои добрые дела чтоб ты потом смог поделиться и запечатлить их в этом приложении',
        ),
        title: Text(
          'Дневник',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bubbleBackgroundColor: Colors.white,
        iconColor: Colors.white,
        mainImage: Image.asset(
          'images/pen.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),

    PageViewModel(
        pageColor: const Color(0xff009688),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Icon(Icons.face),
        body: Text(
          'В профиле ты можешь сделать настройки приложения и своей страницы',
        ),
        title: Text(
          'Профиль',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bubbleBackgroundColor: Colors.white,
        iconColor: Colors.white,
        mainImage: Image.asset(
          'images/user.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
  ];

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Builder(

        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {
            _incrementCounter();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Myapp(),
              ), //MaterialPageRoute
            );
          },
          showSkipButton: false, //Whether you want to show the skip button or not.
          doneText: Text("ГОТОВО"),
          fullTransition: 150.0,
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}

_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int check = (prefs.getInt('check') ?? 1) ;
  print('$check');
  await prefs.setInt('check', check);
}
