import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return  Center(
    child:  Column(
      children: <Widget>[
         Icon(
          Icons.favorite,
          size: 170.0,
          color: Colors.grey
        ),
         Text("FAVORITOS")
      ],
    ),
  
 );
 }
}