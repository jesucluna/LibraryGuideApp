import 'package:flutter/material.dart';
import 'futureclass.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, bottom})
      : super(
          key: key,
          elevation: 0.1,
          backgroundColor: Colors.deepPurpleAccent[700],
          title: title,
        );
  /**/

}

class Futureb extends StatefulWidget {
  final String query;
  const Futureb({Key key, this.query}) : super(key: key);

  @override
  _FuturebState createState() => _FuturebState();
}

class _FuturebState extends State<Futureb> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Data.getBooks(widget.query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        } else {
          return Container(
              color: Colors.black,
              child: GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) => Card(
                      child: Material(
                        child: InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ShowBooks(snapshot.data[index]),
                              )),
                          child: GridTile(
                            footer: Container(
                              padding: EdgeInsets.all(3),
                              height: 30,
                              color: Colors.black,
                              child: Text(
                                snapshot.data[index].title,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            child: Image.network(snapshot.data[index].cover),
                          ),
                        ),
                      ),
                    ),
              ));
        }
      },
    );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Color _default = Colors.deepPurpleAccent[700];
  IconData _home = Icons.home;
  IconData _stuff = Icons.favorite;
  IconData _acc = Icons.account_circle;
  IconData _set = Icons.settings;
  IconData _about = Icons.help;

  Widget _textdrawheader(String text, double _size) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).platform == TargetPlatform.iOS
            ? Colors.black
            : Colors.white,
        fontSize: _size,
      ),
    );
  }

  Widget _inkwelltemplate(String title, IconData icon, String root) {
    IconData _new = Icons.help;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, root);
      },
      child: ListTile(
        title: Text(title),
        leading: Icon(icon, color: (icon == _new) ? Colors.blue : _default),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 230,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountEmail:  _textdrawheader('¡Bienvenido!', 16.0),
              accountName:
                  _textdrawheader('LibraryGuide Demo\n', 16.0),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? _default
                          : Colors.grey,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Theme.of(context).platform == TargetPlatform.iOS
                      ? Colors.white30
                      : _default),
            ),
          ),
          _inkwelltemplate("Recientes", _home, '/home'),
          _inkwelltemplate("Mis libros", _stuff, '/stuff'),
          _inkwelltemplate("Mi Cuenta", _acc, '/account'),
          Divider(),
          _inkwelltemplate("Configuración", _set, '/set'),
          _inkwelltemplate("Info", _about, '/about')
        ],
      ),
    );
  }
}
