import 'package:flutter/material.dart';
import '../default.dart';
import 'pages_stuff/pen.dart';
import 'pages_stuff/end.dart';
import 'pages_stuff/favo.dart';

class Stuff extends StatefulWidget {
  @override
  _StuffState createState() => _StuffState();
}

class _StuffState extends State<Stuff> {
  int _selectedPage = 0;
  final _pageOptions = [
    Favorite(), Pending(), Completed()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('LibraryGuide Demo',style: TextStyle(color: Colors.white,fontSize: 21.5))),
      drawer: MyDrawer(),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        iconSize: 18,
        fixedColor: Colors.green,
        
        onTap: (int index){
          setState(() {
           _selectedPage =index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoritos')
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),      
            title: Text('Pendientes'),
      
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            title: Text('Completados'),
            
          )                    
        ],
      ),
      
    );
  }
}