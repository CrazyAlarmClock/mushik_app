import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tests/detali_page_myhistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

//classes
import 'my_card.dart';
import 'onboarding.dart';
import 'my_history.dart';
import 'card_page.dart';
import 'detali_page_myhistory.dart';
import 'package:tests/Profile.dart';
import 'Login_Activity.dart';


_incrementCounterCheck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('check');
}

void main() {
  _incrementCounterCheck().then((dynamic res) {
    if (res == 1) {
      runApp(new Myapp());
    } else {
      runApp(new OnBoarding());
    }
  });
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return new MaterialApp(
      title: 'app',
      debugShowCheckedModeBanner: false,
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  List historyLocals;
  /// This controller can be used to programmatically
  /// set the current displayed page
  PageController _pageController;

  /// Indicating the current displayed page
  /// 0: trends
  /// 1: feed
  /// 2: community
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new PageView(
            children: <Widget>[
              new Column(
                children: <Widget>[MyCard()],
              ),
              new MyHistory(),
              new Profile()
            ],
            controller: _pageController,
            onPageChanged: onPageChanged),
        bottomNavigationBar: new Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: new BottomNavigationBar(
                fixedColor: Colors.blueAccent,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.format_align_justify),
                    title: Text('Новости'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.edit), title: Text('Дневник')),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.face),
                    title: Text("Профиль"),
                  )
                ],
                onTap: navigationTapped,
                currentIndex: _page)));
  }

  /// Called when the user presses on of the
  /// [BottomNavigationBarItem] with corresponding
  /// page index
  void navigationTapped(int page) {
    // Animating to the page.
    // You can use whatever duration and curve you like
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;

    });
  }

  @override
  void initState() {
    historyLocals = getHistoryLocal();
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

