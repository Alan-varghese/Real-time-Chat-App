import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await signInWithEmailPassword(email, password);
    if (user != null) {
      if (kDebugMode) {
        print("User signed up: ${user.email}");
      }
    } else {
      if (kDebugMode) {
        print("Sign-up failed");
      }
    }
  }

  Future<void> signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await signInWithEmailPassword(email, password);
    if (user != null) {
      if (kDebugMode) {
        print("User signed in: ${user.email}");
      }
    } else {
      if (kDebugMode) {
        print("Sign-in failed");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase Auth")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signUp,
              child: Text("Sign Up"),
            ),
            ElevatedButton(
              onPressed: signIn,
              child: Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
  
  signInWithEmailPassword(String email, String password) {}
}
