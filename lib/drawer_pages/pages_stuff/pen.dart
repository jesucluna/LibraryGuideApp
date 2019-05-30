import 'package:flutter/material.dart';

class Pending extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return  Center(
    child:  Column(
      children: <Widget>[
         Icon(
          Icons.assignment,
          size: 170.0,
          color: Colors.grey
        ),
         Text("PENDIENTES")
      ],
    ),
  
 );
 }
}