import 'package:flutter/material.dart';
import 'login_pages/registerpage.dart';
import 'routes.dart';

void main() => runApp(MaterialApp(
      title: 'LibraryGuide',
      home: RegisterPage(),
      routes: buildAppRoutes(),
    ));



