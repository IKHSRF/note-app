import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/custom_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDrawer(
          title: "About",
          drawerKey: _drawerKey,
        ),
        drawer: CustomDrawer(),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                AboutTeam(
                  nama: "Wahyu sulistio",
                  nim: "065118059",
                ),
                AboutTeam(
                  nama: "Falyan Zuril",
                  nim: "065120702",
                ),
                AboutTeam(
                  nama: "Irfan affandi",
                  nim: "065116345",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutTeam extends StatelessWidget {
  const AboutTeam({
    required this.nama,
    required this.nim,
  });

  final String nama, nim;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        color: Color(0xFFF5F6F9),
        padding: EdgeInsets.symmetric(vertical: defaultPading * 3),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultPading * 2),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.blue,
                ),
              ),
              Text(
                nim,
                style: TextStyle(color: Colors.lightBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
