import 'package:flutter/material.dart';
import 'package:libraryapp/default.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          "LibraryGuide Demo",
          style: TextStyle(color: Colors.white, fontSize: 21.5),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
