import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('lib/assets/images/profil.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            _drawerItem(context, Icons.home, 'Accueil', '/home'),
            _drawerItem(context, Icons.cloud, 'Météo', '/meteo'),
            _drawerItem(context, Icons.photo, 'Galerie', '/gallerie'),
            _drawerItem(context, Icons.public, 'Pays', '/pays'),
            _drawerItem(context, Icons.contact_mail, 'Contact', '/contact'),
            _drawerItem(context, Icons.settings, 'Paramètres', '/parametres'),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Déconnexion'),
              onTap: () => _deconnexion(context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 10),
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 18,
              childAspectRatio: 1.15,
              children: [
                _homeButton(context, Icons.cloud, '/meteo'),
                _homeButton(context, Icons.photo, '/gallerie'),
                _homeButton(context, Icons.public, '/pays'),
                _homeButton(context, Icons.person_add, '/contact'),
                _homeButton(context, Icons.settings, '/parametres'),
                _homeButton(context, Icons.logout, null),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Text(
              'Page Home (Accueil)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  ListTile _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (route != '/home') {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }

  Widget _homeButton(BuildContext context, IconData icon, String? route) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () {
        if (route == null) {
          _deconnexion(context);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      child: Icon(icon, size: 48),
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
