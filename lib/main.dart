// for the json
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Localization
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

import 'app_home_m3.dart';
// Localization
import 'l10n/l10n.dart';
import 'theme/dr_theme.dart';
import 'theme/model_theme.dart';

void main() {
  runApp(DivingRulesApp());
}

class DivingRulesApp extends StatelessWidget {
  const DivingRulesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return GetMaterialApp(
          title: 'diving rules 22-25',
          theme: DrTheme.lightTheme,
          darkTheme: DrTheme.darkTheme,
          themeMode: themeNotifier.themeMode,
          debugShowCheckedModeBanner: false,
          home: DivingRulesMainScreen(),
          // Localization setup
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      }),
    );
  }
}

// TODO: Manage user language selection
// from https://docs.flutter.dev/development/accessibility-and-localization/internationalization
// To get the current localization
// Locale myLocale = Localizations.localeOf(context);

// To manually set the language
// locale: const Locale('es'),
