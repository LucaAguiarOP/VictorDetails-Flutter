import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'src/auth_page.dart';
import 'src/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE30613)),
        scaffoldBackgroundColor: const Color.fromRGBO(33, 38, 46, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(33, 38, 46, 1),
          elevation: 0,
        ),
      ),
    );
  }
}
