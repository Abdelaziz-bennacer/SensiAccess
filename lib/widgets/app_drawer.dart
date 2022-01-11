import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sensi_access/views/my_home_page.dart';
import 'package:sensi_access/views/page_couleurs.dart';
import 'package:sensi_access/views/page_nav_auditive.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: 'Menu de navigation 5 items',
      child: ListView(
        children: [
          DrawerHeader(
            child: const Text(
              'Sensi\'access',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.white.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyHomePage.routeName);
            },
            leading: const Icon(Icons.home),
            title: const Text(
              'Accueil',
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, PageNavigationAuditive.routeName);
            },
            leading: const Icon(FontAwesomeIcons.assistiveListeningSystems),
            title: const Text(
              'La navigation auditive',
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              //Navigator.pushNamed(context, TripsView.routeName);
            },
            leading: const Icon(FontAwesomeIcons.lowVision),
            title: const Text(
              'Les contrastes',
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              //Navigator.pushNamed(context, TripsView.routeName);
            },
            leading: const Icon(FontAwesomeIcons.images),
            title: const Text(
              'Les images',
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, PageCouleurs.routeName);
            },
            leading: const Icon(FontAwesomeIcons.palette),
            title: const Text(
              'Les couleurs',
            ),
          ),
        ],
      ),
    );
  }
}
