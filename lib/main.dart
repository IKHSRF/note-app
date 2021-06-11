import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/pages/about.dart';
import 'package:joke_app/pages/detail.dart';
import 'package:joke_app/pages/edit_note.dart';
import 'package:joke_app/pages/home.dart';
import 'package:joke_app/pages/login.dart';
import 'package:joke_app/pages/new_note.dart';
import 'package:joke_app/pages/profile.dart';
import 'package:joke_app/pages/register.dart';
import 'package:joke_app/pages/setting.dart';
import 'package:joke_app/provider/note_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteProvider(),
      child: Consumer<NoteProvider>(
        builder: (context, color, _) => MaterialApp(
          theme: ThemeData(
            brightness: color.brigthness,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (_) => LoginPage(),
            '/home': (_) => HomePage(),
            '/register': (_) => RegisterPage(),
            '/about': (_) => AboutPage(),
            '/profile': (_) => ProfilePage(),
            '/setting': (_) => SettingPage(),
            '/detail': (_) => DetailPage(),
            '/new': (_) => NewNote(),
            '/edit': (_) => EditNote(),
          },
        ),
      ),
    );
  }
}
