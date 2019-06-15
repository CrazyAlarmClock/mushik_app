import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'Reg_activity.dart';
import 'login_signup_page.dart';
import 'onboarding.dart';
import 'root_page.dart';


class Login_Activity extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<Login_Activity> {

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/logo123.png'),
      ),
    );

    final email = TextField(
      autofocus: true,

      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );

    final password = TextField(
      obscureText: true,
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Пароль',
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () => Navigator.pop(context, main()),

        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('ВОЙТИ', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Забыли пароль?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    var RegButton = RaisedButton(
      onPressed: () => Navigator.pop(context, RootPage()),
      child: Text("РЕГЕСТРАЦИЯ"),
      textColor: Colors.white,
      color: Colors.primaries[0],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
            SizedBox(height: 24.0),

            RegButton,

          ],
        ),
      ),
    );
  }
}

_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int check = (prefs.getInt('check') ?? 1) ;
  print('$check');
  await prefs.setInt('check', check);
}
