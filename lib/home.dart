import 'package:flutter/material.dart';
import 'default.dart';
import 'default_pages/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Row(
              children: <Widget>[
                Expanded(child: Text("LibraryGuide", style: TextStyle(color: Colors.white),),),
                InkWell(
                  child: Icon(Icons.search),
                  onTap:(){
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SearchScreen()));
                  } ,
                )
            
              ],
            ),
        ),
      body: Futureb(),
      drawer: MyDrawer(),
    );
    }
}