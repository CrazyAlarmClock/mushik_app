

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



Firestore firestore = Firestore.instance;

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
      Userinfo.Token = user.uid;
      Userinfo.Email = user.email;
    })
        : null);
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: Firestore.instance.collection('users').document(
            Userinfo.Token).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("");
          }
          Userinfo.UserDocument = snapshot.data;
          return Scaffold(

            body: Center(
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance.collection('stories').where(
                        'agreement', isEqualTo: true).snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error: ${snapshot.error}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator();
                        default:
                          return new ListView(
                            children: snapshot.data.documents
                                .map((DocumentSnapshot document) {
                              return new CustomCard(
                                document: document,
                              );
                            }).toList(),
                          );
                      }
                    },
                  )),
            ),
          );
        });
  }}

  class CustomCard extends StatelessWidget {
  CustomCard({@required  this.document});

  final DocumentSnapshot document;
  updateCount() async {

    await firestore
        .collection('stories')
        .document(document.documentID)
        .updateData({'number_of_views': document['number_of_views']+1});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        ),
        child: InkWell(

            onTap: (){
              updateCount();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Story(title: document['title'],token: document['token'],agreement: document['agreement'], body: document['body'], date: document['date'], views: document['number_of_views'], nickname: document['nickname'] )),
              );
            },

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 2.0),
                  child: Text(
                    document['nickname'] ?? "nickname",
                    style:
                    TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 15),

                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 2.0),
                  child: Text(
                    document['title'] ?? "nickname",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 2.0),
                  child: Text(
                    document['date'] ?? "nickname" ,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16.0, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 15),



                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 2.0),
                  child: Text("Просмотров: " + document['number_of_views'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 16.0, color: Colors.grey),
                  ),
                ),


                    SizedBox(height: 15),
              ],
            )));
  }
  }