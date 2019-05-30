import 'package:flutter/material.dart';
import 'package:libraryapp/default.dart';

class SearchWidget extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search..."),
                onSubmitted: (String info) {
                  if (info.isNotEmpty) {
                    
                  }
                },
                
              ),
            ),
            Icon(Icons.search, color: Colors.black54)
          ],
        ),
      ),
    );
  }
}

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
      appBar: MyAppBar(
        title: SearchWidget(),
      ),
      body: Futureb()

    );
  }
}