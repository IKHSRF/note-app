import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/provider/note_provider.dart';
import 'package:provider/provider.dart';

class AppBarDrawer extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => Size.fromHeight(300);
  const AppBarDrawer({
    Key? key,
    required this.title,
    required GlobalKey<ScaffoldState> drawerKey,
  })  : _drawerKey = drawerKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _drawerKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultPading * 2),
      height: defaultPading * 8,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              _drawerKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: noteProvider.color,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
      ),
    );
  }
}
