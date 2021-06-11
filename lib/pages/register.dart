import 'package:flutter/material.dart';
import 'package:joke_app/common/utils.dart';
import 'package:joke_app/provider/note_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<NoteProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultPading * 6,
                vertical: defaultPading * 16,
              ),
              padding: EdgeInsets.all(defaultPading * 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 12.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: defaultPading * 6),
                  TextField(
                    decoration: InputDecoration(hintText: "Email Address"),
                    onChanged: (value) {
                      authProvider.email = value;
                    },
                  ),
                  SizedBox(height: defaultPading * 6),
                  TextField(
                    decoration: InputDecoration(hintText: "Password"),
                    obscureText: true,
                    onChanged: (value) {
                      authProvider.password = value;
                    },
                  ),
                  SizedBox(height: defaultPading * 6),
                  TextButton(
                    onPressed: () {
                      authProvider.register(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: defaultPading,
                        horizontal: defaultPading * 6,
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                  ),
                  SizedBox(height: defaultPading * 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah Punya Akun?"),
                      SizedBox(width: defaultPading / 4),
                      TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/');
                        },
                        child: Text("Login"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
