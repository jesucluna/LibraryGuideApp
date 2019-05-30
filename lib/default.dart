import 'package:flutter/material.dart';
import 'package:libraryapp/default_pages/search.dart';
import 'package:libraryapp/default_pages/searchwidget.dart';
import 'package:libraryapp/login_pages/loginemail.dart';
import 'package:libraryapp/login_pages/registerpage.dart';
import 'drawer_pages/account.dart';
import 'drawer_pages/cat.dart';
import 'drawer_pages/set.dart';
import 'drawer_pages/stuff.dart';
import 'drawer_pages/about.dart';
import 'main.dart';
import 'futureclass.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, @required Widget title, bottom})
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
          return GridView.builder(
            itemCount: snapshot.data.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          child: Image.network(snapshot.data[index].cover),
                        ),
                      ),
                    ),
                 
                ),
          );
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
  IconData _cat = Icons.dashboard;
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

  Widget _myrbutton(String text, Widget ruta) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.white
                : Colors.black),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Theme.of(context).platform == TargetPlatform.iOS
          ? Colors.black
          : Colors.white,
      onPressed: () {
        Navigator.popUntil(
            context, ModalRoute.withName(Navigator.defaultRouteName));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => ruta));
      },
    );
  }

  Widget _inkwelltemplate(String title, IconData icon, Widget root) {
    IconData _new = Icons.help;

    return InkWell(
      onTap: () {
        Navigator.popUntil(
            context, ModalRoute.withName(Navigator.defaultRouteName));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => root));
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
              accountName:
                  _textdrawheader('LibraryGuide Demo\n¡Inicia Sesión!', 16.0),
              accountEmail: Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: _myrbutton("REGISTRARME   ", RegisterPage())),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: _myrbutton("INICIAR SESION  ", LoginPage()))
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
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
          _inkwelltemplate("Recientes", _home, HomePage()),
          _inkwelltemplate("Mis libros", _stuff, Stuff()),
          _inkwelltemplate("Mi Cuenta", _acc, Account()),
          _inkwelltemplate("Categorias", _cat, Categories()),
          Divider(),
          _inkwelltemplate("Configuración", _set, Settings()),
          _inkwelltemplate("Info", _about, About())
        ],
      ),
    );
  }
}
