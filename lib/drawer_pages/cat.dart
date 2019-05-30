import 'package:flutter/material.dart';
import '../default.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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