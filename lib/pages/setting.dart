import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/provider/note_provider.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
    final noteProvider = Provider.of<NoteProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDrawer(
          title: "Setting",
          drawerKey: _drawerKey,
        ),
        drawer: CustomDrawer(),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: defaultPading * 2,
              horizontal: defaultPading * 4,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Warna Tema Aplikasi",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Light",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Expanded(
                  child: Switch(
                    value: noteProvider.isDark,
                    onChanged: (value) {
                      noteProvider.isDark = value;
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    "Dark",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        color: Color(0xFFF5F6F9),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.all(defaultPading),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 115,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/flutter.png"),
      ),
    );
  }
}
