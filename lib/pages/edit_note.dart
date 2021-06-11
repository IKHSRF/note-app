import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/provider/note_provider.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class EditNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    final noteProvider = Provider.of<NoteProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDrawer(
          title: "Edit Note",
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: snapshot.data['title'],
                        ),
                        onChanged: (value) {
                          noteProvider.title = value;
                        },
                      ),
                      SizedBox(height: defaultPading * 4),
                      TextField(
                        maxLines: 26,
                        decoration: InputDecoration(
                          hintText: snapshot.data['note'],
                        ),
                        onChanged: (value) {
                          noteProvider.note = value;
                        },
                      ),
                      SizedBox(height: defaultPading * 4),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(defaultPading),
                          child: Text(
                            "Edit Note",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          noteProvider.updateNote(
                            snapshot.data.id,
                            context,
                            snapshot.data,
                          );
                        },
                      ),
                      SizedBox(height: defaultPading * 4),
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
