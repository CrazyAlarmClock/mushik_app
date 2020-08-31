
import 'package:flutter/material.dart';

class RegistPage extends StatefulWidget {
  @override
  _RegistPagePageState createState() => _RegistPagePageState();
}

class _RegistPagePageState extends State<RegistPage> {
  String email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height: 600.0,
                width: 500.0,
                child: Column(
                  children: <Widget>[
                    Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: Image.network(
                              'https://lh3.googleusercontent.com/proxy/ndeaXC7DHgwSSYvzqj7m7fa8gx-kcmhQpOUKH5QMDsNJAmoCgnwxsrbOF4UN1juaFHCAEMlsAbdwkqjJafBBu7c9eMx-VgZYfh7n0IDZ4nPU9dQA8jzf',
                              scale: 2,
                            )),
                            SizedBox(
                              height: 100,
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Email'),
                                    validator: (value) => value.isEmpty
                                        ? 'Email is required'
                                        : validateEmail(value.trim()),
                                    onChanged: (value) {
                                      this.email = value;
                                    },
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration:
                                        InputDecoration(hintText: 'Пароль'),
                                    validator: (value) => value.isEmpty
                                        ? 'Password is required'
                                        : null,
                                    onChanged: (value) {
                                      this.password = value;
                                    },
                                  ),
                                )),
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                                onTap: () {
                                  if (checkFields()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegistPageContinue(
                                                    email, password)));
                                  }
                                },
                                child: Container(
                                    height: 50.0,
                                    width: 250.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),

                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                        child: Text('ЗАРЕГИСТРИРОВАТЬСЯ', style: TextStyle(color: Colors.white),))))
                          ],
                        ))
                  ],
                ))));
  }
}

class RegistPageContinue extends StatefulWidget {
  final String email;
  final String password;
  RegistPageContinue(this.email, this.password);

  @override
  _RegistPageContinueState createState() => _RegistPageContinueState();
}

class _RegistPageContinueState extends State<RegistPageContinue> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  String name;
  String surname;
  String nickname;
  String birthday;
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  bool agreement = false;

  final formKey = new GlobalKey<FormState>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: this._formKey,
        body: Center(
            child: Container(
                height: 800.0,
                width: 500.0,
                child: Column(
                  children: <Widget>[
                    Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              'Ваш email: ' + widget.email,
                              style: TextStyle(color: Colors.grey),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Псевданим'),
                                    validator: (value) =>
                                        value.isEmpty ? 'Поле пустое' : null,
                                    onChanged: (value) {
                                      this.nickname = value;
                                    },
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0,
                                  right: 25.0,
                                  top: 20.0,
                                  bottom: 5.0),
                              child: Container(
                                height: 50.0,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        child: FlatButton(
                                      child: Text('Цвет аватара'),
                                      onPressed: () => showDialog(
                                        context: context,
                                        child: AlertDialog(
                                          title: const Text(
                                              'Выберете цвет вашего аватара', ),
                                          content: SingleChildScrollView(
                                             child: BlockPicker(
                                               pickerColor: currentColor,
                                               onColorChanged: changeColor,
                                             ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: const Text('Выбрать'),
                                              onPressed: () {
                                                setState(() =>
                                                    currentColor = pickerColor);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                    CircleAvatar(
                                      backgroundColor: currentColor,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Имя'),
                                    validator: (value) =>
                                        value.isEmpty ? 'Поле пустое' : null,
                                    onChanged: (value) {
                                      this.name = value;
                                    },
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: 'Фамилия'),
                                    validator: (value) => value.isEmpty
                                        ? 'This field is empty'
                                        : null,
                                    onChanged: (value) {
                                      this.surname = value;
                                    },
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0,
                                    right: 25.0,
                                    top: 20.0,
                                    bottom: 5.0),
                                child: Container(
                                  height: 50.0,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Дата рождения'),
                                    validator: (value) =>
                                        value.isEmpty ? 'Поле пустое' : null,
                                    onChanged: (value) {
                                      this.birthday = value;
                                    },
                                  ),
                                )),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: CheckboxListTile(
                                  checkColor: Colors.white,
                                  activeColor: Colors.red,
                                  value: agreement,
                                  title: new Container(
                                    child: new RichText(
                                      text: new TextSpan(
                                        children: [
                                          new TextSpan(
                                            text: 'Я соглашаюсь с',
                                            style: new TextStyle(
                                                color: Colors.grey),
                                          ),
                                          new TextSpan(
                                            text: ' правилами данного сервиса',
                                            style: new TextStyle(
                                                color: Colors.blue,
                                                decoration:
                                                    TextDecoration.underline),
                                            recognizer:
                                                new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    launch('http://mushik.ru/');
                                                  },
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  onChanged: (bool value) =>
                                      setState(() => agreement = value)),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            InkWell(
                                onTap: () async {
                                  if (checkFields() && agreement == true) {
                                    AuthService().register(
                                        widget.email, widget.password, name, surname, nickname, birthday);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) => MyApp()));
                                  }

                                },
                                child: Container(
                                    height: 50.0,
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.blue,
                                    ),
                                    child: Center(child: Text('CОЗДАТЬ АККАУНТ' , style: TextStyle(color: Colors.white))))),
                          ],
                        ))
                  ],
                ))));
  }
}
