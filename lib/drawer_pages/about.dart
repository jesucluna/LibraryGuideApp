import 'package:flutter/material.dart';
import '../default.dart';


class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('LibraryGuide Demo',style: TextStyle(color: Colors.white,fontSize: 21.5))
      ),
      drawer: MyDrawer(),
    );
  }
}
