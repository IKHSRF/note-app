import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/custom_drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDrawer(
          title: "Profile",
          drawerKey: _drawerKey,
        ),
        drawer: CustomDrawer(),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ProfilePic(),
                SizedBox(height: 20),
                Text(
                  "Admin",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(height: 20),
                ProfileMenu(
                  text: "Settings",
                  press: () {
                    Navigator.pushNamed(context, '/setting');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    required this.text,
    required this.press,
  });

  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xFFF5F6F9),
          ),
        ),
        onPressed: press,
        child: Container(
          margin: EdgeInsets.all(defaultPading),
          child: Row(
            children: [
              Expanded(child: Text(text)),
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
