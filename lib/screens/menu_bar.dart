import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:mushik/screens/home_screen.dart';
import 'package:mushik/screens/my_tasks.dart';
import 'package:mushik/screens/profile.dart';





class MenuBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _MenuBarState();
  }
}

class _MenuBarState extends State<MenuBar> {
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
                  HomePage(),
              new MyTaskPage(),
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
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

