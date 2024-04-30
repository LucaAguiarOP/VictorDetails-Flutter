import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'src/auth_page.dart';
import 'src/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.init();

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
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales);
  }
}
