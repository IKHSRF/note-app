import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/provider/note_provider.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class NewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    final noteProvider = Provider.of<NoteProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDrawer(
          title: "Add Note",
          drawerKey: _drawerKey,
        ),
        drawer: CustomDrawer(),
        body: SizedBox.expand(
          child: SingleChildScrollView(
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
                      hintText: "Judul",
                    ),
                    onChanged: (value) {
                      noteProvider.title = value;
                    },
                  ),
                  SizedBox(height: defaultPading * 4),
                  TextField(
                    maxLines: 30,
                    decoration: InputDecoration(
                      hintText: "Note..",
                    ),
                    onChanged: (value) {
                      noteProvider.note = value;
                    },
                  ),
                  SizedBox(height: defaultPading * 4),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(defaultPading),
                      child: Text(
                        "Tambah Note",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      noteProvider.addNote(context);
                    },
                  ),
                  SizedBox(height: defaultPading * 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
