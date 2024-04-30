import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:victordetailsflutter/src/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';

class Config {
  static late AppLocalizations localizations;
  static late String codeLanguage;

  static void initLocale(BuildContext context) {
    localizations = AppLocalizations.of(context)!;
    codeLanguage = Localizations.localeOf(context).languageCode;
  }

  static Future<void> init() async {
      await initializeDateFormatting('pt_BR', null);
      await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    
  }
}
