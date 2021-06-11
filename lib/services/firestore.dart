import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joke_app/model/note.dart';

class Firestore {
  CollectionReference note = FirebaseFirestore.instance.collection('note');

  Stream<List<Note>> getNote() => note.snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList(),
      );

  Future<String> addNote(Note notes) async {
    try {
      await note.add(notes.toFirestore());
      return 'ok';
    } catch (error) {
      print(error);
      return error.toString();
    }
  }

  Future<String> updateNote(String id, Note notes) async {
    try {
      await note.doc(id).set(notes.toFirestore(), SetOptions(merge: true));
      return 'ok';
    } catch (error) {
      print(error);
      return error.toString();
    }
  }

  Future<String> remoteNote(String id) async {
    try {
      await note.doc(id).delete();
      return 'ok';
    } catch (error) {
      print(error);
      return error.toString();
    }
  }
}
