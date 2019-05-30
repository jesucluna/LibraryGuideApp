import 'package:flutter/material.dart';
import '../default.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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