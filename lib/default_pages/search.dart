import 'package:flutter/material.dart';
import 'package:libraryapp/default.dart';


class SearchScreen extends StatefulWidget {
 
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String quer;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title:Card(
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
                onChanged: (String info) {
                  if (info.isNotEmpty) {
                    quer=info;
                  }
                },
                
              ),
            ),
            Icon(Icons.search, color: Colors.black54)
          ],
        ),
      ),
    ),
      ),

    body: Futureb(query: quer,),

    );
  }
}
