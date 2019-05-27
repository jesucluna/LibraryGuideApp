import 'package:flutter/material.dart';
import '../default.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Registrar',style: TextStyle(color: Colors.white,fontSize: 21.5))
      ),
      body: Center(child: Text("Has la magia aqui :v"),),
      
    );
  }
}