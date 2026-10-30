import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
   InscriptionPage({super.key});

  static final TextEditingController txtLogin = TextEditingController();
  static final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Inscription')),
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
            onPressed: () { _oninscri(context); },
            child: const Text(
              'Inscription',
              style: TextStyle(fontSize: 22),
            ),
          ),
          TextButton(
            child: const Text(
              "J'ai déjà un compte",
              style: TextStyle(fontSize: 22),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/authentification');
            },
          ),
        ],
      ),
    );
  }
  Future<void> _oninscri(BuildContext context)async {
    prefs = await SharedPreferences.getInstance();
    if(!txtLogin.text.isEmpty && !txtPassword.text.isEmpty){
      await prefs.setString('login', txtLogin.text);
      await prefs.setString('password', txtPassword.text);
  Navigator.pop(context);
  Navigator.pushNamed(context, '/home');
    }  
  }
}