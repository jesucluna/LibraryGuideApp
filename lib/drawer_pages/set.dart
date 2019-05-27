import 'package:flutter/material.dart';
import '../default.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('LibraryGuide',style: TextStyle(color: Colors.white,fontSize: 21.5))
      ),
      drawer: MyDrawer(),
      
    );
  }
}