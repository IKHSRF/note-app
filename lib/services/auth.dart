import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'ok';
    } catch (error) {
      print(error);
      return error.toString();
    }
  }

  Future<String> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'ok';
    } catch (error) {
      print(error);
      return error.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
