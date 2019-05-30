import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return  Center(
    child:  Column(
      children: <Widget>[
         Icon(
          Icons.check_circle,
          size: 170.0,
          color: Colors.grey
        ),
         Text("COMPLETADOS")
      ],
    ),
  
 );
 }
}