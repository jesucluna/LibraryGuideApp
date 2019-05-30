import 'package:flutter/material.dart';
import 'package:libraryapp/default.dart';
class SearchScreen extends StatefulWidget {
  final String quer;

  const SearchScreen({Key key, this.quer}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),

    );
  }
}