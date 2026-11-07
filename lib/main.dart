import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp1/pages/authentication.page.dart';
import 'package:tp1/pages/contact.page.dart';
import 'package:tp1/pages/gallerie.page.dart';
import 'package:tp1/pages/home.page.dart';
import 'package:tp1/pages/inscription.page.dart';
import 'package:tp1/pages/meteo.page.dart';
import 'package:tp1/pages/parametres.page.dart';
import 'package:tp1/pages/pays.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => Homepage(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/meteo': (context) => const MeteoPage(),
    '/gallerie': (context) => const GalleriePage(),
    '/pays': (context) => const PaysPage(),
    '/contact': (context) => const ContactPage(),
    '/parametres': (context) => const ParametresPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final isConnected = snapshot.data?.getBool('connecte') ?? false;
          return isConnected ? Homepage() : AuthentificationPage();
        },
      ),
    );
  }
}
