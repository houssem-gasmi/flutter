import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: const Center(child: Text('Page d\'home')),
    );
  }
}
