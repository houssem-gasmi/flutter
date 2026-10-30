import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;
  AuthentificationPage({super.key});

  final TextEditingController txtLogin = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Authentification')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: txtLogin,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: 'Utilisateur',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: txtPassword,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                hintText: 'Mot de passe',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              onauthentification(context);
            },
            child: const Text(
              'Authentification',
              style: TextStyle(fontSize: 22),
            ),
          ),
          TextButton(
            child: const Text(
              'Nouvel Utilisateur',
              style: TextStyle(fontSize: 22),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/inscription');
            },
          ),
        ],
      ),
    );
  }

  Future<void> onauthentification(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String log = prefs.getString('login') ?? '';
    String pwd = prefs.getString('password') ?? '';

    print(txtLogin.text == log && txtPassword.text == pwd);
    if (txtLogin.text == log && txtPassword.text == pwd) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    }
  }
}
