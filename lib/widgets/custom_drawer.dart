import 'package:flutter/material.dart';
import 'package:joke_app/provider/note_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/drawerImage.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(),
          ),
          DrawerItem(
            title: "Dashboard",
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          DrawerItem(
            title: "About",
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          DrawerItem(
            title: "Profile",
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          DrawerItem(
            title: "Setting",
            onTap: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
          DrawerItem(
            title: "Log Out",
            onTap: () {
              noteProvider.logout(context);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onTap: onTap,
    );
  }
}
