import 'package:flutter/material.dart';
import 'package:libraryapp/default.dart';
import 'package:libraryapp/default_pages/search.dart';
import 'futureclass.dart';



void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LibraryGuide',
      home: HomePage(
        title: 'LibraryGuideFree',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SearchScreen(),    
    );
    }
}
       /*return ListView.builder(
               ||||||||||||||||||2e      itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                        leading: Image.network(snapshot.data[index].cover),
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].author),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => ShowBooks(snapshot.data[index])));
                        },
                      ),
                );*/