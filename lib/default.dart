import 'package:flutter/material.dart';
import 'drawer_pages/account.dart';
import 'drawer_pages/cat.dart';
import 'drawer_pages/set.dart';
import 'drawer_pages/stuff.dart';
import 'drawer_pages/about.dart';
import 'main.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, bottom})
      : super(
            key: key,
            elevation: 0.1,
            backgroundColor: Colors.deepPurpleAccent[700],
            title: title,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
            ]);
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
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => root));
      },
      child: ListTile(
        title: Text(title),
        leading: Icon(icon, color: (icon==_new)?Colors.blue : _default),
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
                        child: _myrbutton("REGISTRARME   ", HomePage())),
                    Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: _myrbutton("INICIAR SESION  ", HomePage()))
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
          _inkwelltemplate("Home",_home, HomePage()),
          _inkwelltemplate("Mis Cosas",_stuff, Stuff()),
          _inkwelltemplate("Mi Cuenta", _acc, Account()),
          _inkwelltemplate("Categorias", _cat,Categories()),
          Divider(),
          _inkwelltemplate("Configuración", _set, Settings()),
          _inkwelltemplate("Info", _about, About())
        ],
      ),
    );
  }
}