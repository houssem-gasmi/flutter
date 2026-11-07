import 'package:flutter/material.dart';

class MeteoPage extends StatelessWidget {
  const MeteoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Météo')),
      body: const Center(child: Text('Page Météo')),
    );
  }
}
