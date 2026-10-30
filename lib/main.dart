import 'package:flutter/material.dart';
import 'package:tp1/pages/authentication.page.dart';
import 'package:tp1/pages/home.page.dart';
import 'package:tp1/pages/inscription.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => Homepage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: InscriptionPage(),
    );
  }
}
