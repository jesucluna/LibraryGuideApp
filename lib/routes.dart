import 'package:flutter/material.dart';
import 'home.dart';
import 'drawer_pages/stuff.dart';
import 'drawer_pages/set.dart';
import 'drawer_pages/account.dart';
import 'drawer_pages/about.dart';
import 'login_pages/loginemail.dart';
import 'login_pages/registerpage.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    '/home': (BuildContext context) => HomePage(),
    '/stuff': (BuildContext context) => Stuff(),
    '/account': (BuildContext context) => Account(),
    '/set': (BuildContext context) => Settings(),
    '/about': (BuildContext context) => About(),
    '/login': (BuildContext context)=> LoginPage(),
    '/register': (BuildContext context)=> RegisterPage(),
  };
}
