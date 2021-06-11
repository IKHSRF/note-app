import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/custom_drawer.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDrawer(
          title: "Detail",
          drawerKey: _drawerKey,
        ),
        drawer: CustomDrawer(),
        body: SizedBox.expand(
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('note')
                .doc(ModalRoute.of(context)?.settings.arguments.toString())
                .get(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPading * 4,
                    vertical: defaultPading * 2,
                  ),
                  child: Column(
                    children: [
                      Text(
                        snapshot.data['title'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      SizedBox(height: defaultPading * 4),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(snapshot.data['note']),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
