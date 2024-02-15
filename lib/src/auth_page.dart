import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:victordetailsflutter/src/car_page.dart';
import 'package:victordetailsflutter/src/login_page.dart';
import 'package:victordetailsflutter/src/nav_tab.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavTab();
          }
          else {
            return LoginPage();
          }
        }
      )
    );
  }
}