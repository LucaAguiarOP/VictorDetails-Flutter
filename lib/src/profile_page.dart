import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Text(
        'logado como${user.email!}',
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
