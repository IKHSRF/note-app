import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/provider/note_provider.dart';
import 'package:joke_app/widgets/custom_app_bar.dart';
import 'package:joke_app/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    final noteProvider = Provider.of<NoteProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarDrawer(
          title: "Home Page",
          drawerKey: _drawerKey,
        ),
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new');
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: StreamBuilder(
            stream: noteProvider.getNoteList,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return NoteCard(
                    snapshot: snapshot,
                    index: index,
                    noteProvider: noteProvider,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final snapshot;
  final index;
  final NoteProvider noteProvider;

  NoteCard({
    required this.snapshot,
    required this.index,
    required this.noteProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: defaultPading,
        vertical: defaultPading,
      ),
      margin: EdgeInsets.all(defaultPading * 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: kGrey3, width: 1.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: snapshot.data[index].id,
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/flutter.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: defaultPading * 5),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: defaultPading * 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: defaultPading * 2),
                    Text(
                      snapshot.data[index].note,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: defaultPading * 2,
                ),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/edit',
                          arguments: snapshot.data[index].id,
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: defaultPading),
                    IconButton(
                      onPressed: () {
                        noteProvider.deleteNote(
                          snapshot.data[index].id,
                          context,
                        );
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
