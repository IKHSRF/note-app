import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String? id;
  final String title;
  final String note;

  Note({
    this.id,
    required this.title,
    required this.note,
  });

  factory Note.fromFirestore(DocumentSnapshot snapshot) {
    return Note(
      id: snapshot.id,
      note: snapshot['note'],
      title: snapshot['title'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "note": note,
    };
  }
}
