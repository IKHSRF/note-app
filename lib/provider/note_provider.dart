import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/model/note.dart';
import 'package:joke_app/services/auth.dart';
import 'package:joke_app/services/firestore.dart';

class NoteProvider with ChangeNotifier {
  final firestore = Firestore();
  final auth = Auth();

  late String _title = "";
  late String _note = "";
  late String _email = "";
  late String _password = "";
  late bool _isDark = false;

  // Getter
  bool get isDark => _isDark;
  Brightness get brigthness => (_isDark) ? Brightness.dark : Brightness.light;
  String get title => _title;
  String get note => _note;
  String get email => _email;
  String get password => _password;
  Color get color => (_isDark) ? Colors.white : Colors.black;
  Stream<List<Note>> get getNoteList => firestore.getNote();

  // Setter
  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }

  set title(String value) {
    _title = value;
    notifyListeners();
  }

  set note(String value) {
    _note = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  // Function

  login(BuildContext context) async {
    if (_email == "" || _password == "") {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ada Data Yang Kosong"),
        ),
      );
    } else {
      var result = await auth.login(_email, _password);
      if (result == 'ok') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Berhasil Login"),
          ),
        );
        return Navigator.popAndPushNamed(context, '/home');
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result),
          ),
        );
      }
    }
  }

  register(BuildContext context) async {
    if (_email == "" || _password == "") {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ada Data Yang Kosong"),
        ),
      );
    } else {
      var result = await auth.register(_email, _password);
      if (result == 'ok') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Berhasil Register"),
          ),
        );
        return Navigator.popAndPushNamed(context, '/home');
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result),
          ),
        );
      }
    }
  }

  logout(BuildContext context) {
    auth.signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Logout Berhasil"),
      ),
    );
    return Navigator.popAndPushNamed(context, '/');
  }

  addNote(BuildContext context) async {
    if (_title == "" || _note == "") {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ada Data Yang Kosong"),
        ),
      );
    } else {
      var notes = Note(
        note: _note,
        title: _title,
      );
      _note = "";
      _title = "";

      var result = await firestore.addNote(notes);
      if (result == 'ok') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Berhasil Menambahkan Note"),
          ),
        );
        return Navigator.popAndPushNamed(context, '/home');
      } else {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result),
          ),
        );
      }
    }
  }

  updateNote(
    String id,
    BuildContext context,
    DocumentSnapshot snapshot,
  ) async {
    var notes = Note(
      title: _title == "" ? snapshot['title'] : _title,
      note: _note == "" ? snapshot['note'] : _note,
    );
    var result = await firestore.updateNote(id, notes);
    if (result == 'ok') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Data berhasil diubah!"),
        ),
      );
      return Navigator.popAndPushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result),
        ),
      );
    }
  }

  deleteNote(String id, BuildContext context) async {
    firestore.remoteNote(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Data Sudah Dihapus")),
    );
  }
}
