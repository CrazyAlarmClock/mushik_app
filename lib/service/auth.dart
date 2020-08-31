

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mushik/screens/login_screen.dart';
import 'package:mushik/screens/menu_bar.dart';
import 'package:mushik/service/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

handleAuth() {

  return StreamBuilder(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (context, snaphot) {
      if (snaphot.hasData) {
        SharedPreferences.getInstance().then((SharedPreferences prefs) {
          Userinfo.Token = prefs.getString('uid');
          if ( Userinfo.Token!= null) {
            runApp(new MenuBar());
          } else {
            runApp(new LoginPage());
          }
        });
        return MenuBar();
      } else {
        SharedPreferences.getInstance().then((SharedPreferences prefs) {
          Userinfo.Token = prefs.getString('uid');
          if ( Userinfo.Token!= null) {
            runApp(new MenuBar());
          } else {
            runApp(new LoginPage());
          }
        });
        return LoginPage();
      }
    },
  );
}

//Sign Out
signOut() {
  FirebaseAuth.instance.signOut();
  print('вышел ы');

}

//Sign in
signIn(email, password) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .then((user) {
    Userinfo.Token = user.user.uid;
    Userinfo.Email = user.user.email;
    print('Signed in');
    SharedPreferences.getInstance().then((SharedPreferences prefs) async {
      prefs.setString('uid', user.user.uid);
    });

  }).catchError((e) {
    print(e);
    return AlertDialog(

    );

  });
}


register(email, password,  name,  surname,  nickname,  birthday) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((user) {
    firestore
        .collection('users')
        .document(user.user.uid)
        .setData({
      'name': name,
      'surname': surname,
      'nickname': nickname,
      'birthday': birthday,
      'email': email,
    });
    print('ok!');
    Userinfo.Token = user.user.uid;
    Userinfo.Email = user.user.email;
    Userinfo.Nicknme = nickname;
    print(Userinfo.Nicknme);

    SharedPreferences.getInstance().then((SharedPreferences prefs) async {
      prefs.setString('uid', user.user.uid);
    });
  }).catchError((e) {
    print(e);
  });
}

}

