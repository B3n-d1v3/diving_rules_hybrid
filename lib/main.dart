// for the json
import 'package:diving_rules_hybrid/nav_about/screen_about.dart';
import 'package:diving_rules_hybrid/nav_quiz/screen_quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Localization
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

import 'app_home_m3.dart';
// Localization (inline command to generate files with new values: flutter gen-l10n)
import 'l10n/l10n.dart';
import 'nav_penalty_list/screen_penalty_list.dart';
import 'nav_rulebook/screen_rulebook.dart';
import 'theme/dr_theme.dart';
import 'theme/model_theme.dart';

void main() {
  runApp(DivingRulesApp());
}

class DivingRulesApp extends StatelessWidget {
  const DivingRulesApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Block to vertical viewport on mobile only
    // TODO Later check why the titles do not follow the text size growth

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
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => DivingRulesMainScreen()),
            GetPage(name: '/rulebook', page: () => const ScreenRulebook()),
            GetPage(name: '/penalties', page: () => const ScreenPenaltyList()),
            GetPage(name: '/quiz', page: () => ScreenQuiz()),
            GetPage(name: '/about', page: () => const ScreenAbout()),
          ],
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
