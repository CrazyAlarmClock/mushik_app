//import 'package:flutter/material.dart';
//import 'my_history.dart';
//import 'my_card.dart';
//
//
//class Home extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _HomeState();
//  }
//}
//
//class _HomeState extends State<Home> {
//  PageController _pageController;
//  int _currentIndex = 0;
//  final List<Widget> _children = [
//    myCard(),
//    PlaceholderWidget(Colors.deepOrange),
//    PlaceholderWidget(Colors.black)
//
//    // PlaceholderWidget(Colors.blue)
//
//  ];
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _children[_currentIndex], // new
//        bottomNavigationBar: new Theme(
//        data: Theme.of(context).copyWith(
//      // sets the background color of the `BottomNavigationBar`
//          canvasColor: Colors.white,
//
//    ), // sets the inactive color of the `BottomNavigationBar`
//    child: new BottomNavigationBar(
//        onTap: onTabTapped, // new
//        currentIndex: _currentIndex, // new
//
//        type: BottomNavigationBarType.fixed,
//        fixedColor: Colors.green,
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.format_align_justify),
//            title: Text('Новости'),
//          ),
////          BottomNavigationBarItem(
////            icon:  Icon(Icons.add),
////            title: Text('ХЗ'),
////          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.edit),
//              title: Text('Дневник')
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.face),
//              title: Text("Профиль"),
//
//          )
//        ],
//      ),
//        ),
//    );
//  }
//  void onTabTapped(int index) {
//    setState(() {
//      _currentIndex = index;
//    });
//  }
//}