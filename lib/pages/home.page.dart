import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Home')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              _deconnexion(context);
            },
            child: const Text('Déconnexion', style: TextStyle(fontSize: 22)),
          ),
        ),
      ),
    );
  }

  Future<void> _deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setBool('connecte', false);
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/authentification',
      (Route<dynamic> route) => false,
    );
  }
}
