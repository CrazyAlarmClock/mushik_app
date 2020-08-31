

class AddHistory extends StatefulWidget {
  @override
  _AddHistoryPageState createState() => _AddHistoryPageState();
}

class _AddHistoryPageState extends State<AddHistory> {

  String _title;
  String _body;
  bool _agreement = false;
  Firestore firestore = Firestore.instance;
  var _time = new DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,

        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await firestore.collection('stories').add({
              'title': _title,
              'body':_body,
              'nickname' : Userinfo.UserDocument['nickname'] ,
              'agreement': _agreement,
              'token': Userinfo.Token,
              'number_of_views': 0,
              'date': ('${_time.day}.${_time.month}.${_time.year}').toString(),
            });
            SnackBar(content: Text('История сохранена',style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MenuBar()));            // Add your onPressed code here!
          },
          label: Text('Сохранить историю'),
          icon: Icon(Icons.check),
          backgroundColor: Colors.blue,
        ),
        body: Column(

      children: <Widget>[
        SizedBox(height: 40,),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            maxLines: null,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Название'),
            onChanged: (title) {
              _title = title;
            },
          ),
        ),
        SizedBox(height: 40,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            maxLines: null,
            autofocus: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Моя история'
            ),
            onChanged: (body) {
              _body = body;
            },
          ),

        ),
        new Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CheckboxListTile(
              activeColor: Colors.blue,
              value: _agreement,
              title: Text('Опубликовать вашу историю?'),
              onChanged: (bool value) =>
                  setState(() => _agreement = value))),


      ],
    )

    );
  }
}
