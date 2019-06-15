import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tests/Login_Activity.dart';
import 'login_signup_page.dart';


class Reg_activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Почта'
                      )
                  ),
                  TextField(
                      maxLines: null,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Пароль'
                      )
                  ),

                  MaterialButton(
                    onPressed: () => Navigator.pop(context, null),
                    color: Colors.red,
                    child: new Text("СОХРАНИТЬ"),
                    textColor: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () => Navigator.pop(context, LoginSignUpPage()),
                    color: Colors.blue,
                    child: new Text("ЛОГИН"),
                    textColor: Colors.white,
                  )
                ]
            )
        )
    );
  }
}
