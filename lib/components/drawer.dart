import 'package:flutter/material.dart';
import 'package:piconote/components/drawer_title.dart';
import 'package:piconote/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // header
          DrawerHeader(
            child: Image.asset('icons/noteIcon.png'),
          ),

          //notes title
          DrawerTitle(
            title: 'Notes',
            leading: Icon(Icons.note),
            onTap: () => Navigator.pop(context),
          ),

          //settings
          DrawerTitle(
            title: 'Settings',
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}
