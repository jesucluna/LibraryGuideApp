import 'package:flutter/material.dart';
import '../default.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Iniciar sesión',style: TextStyle(color: Colors.white,fontSize: 21.5))
      ),
      body: Center(child: Text("Has la magia aqui :v"),),
      
    );
  }
}