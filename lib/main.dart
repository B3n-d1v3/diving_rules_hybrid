import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'tokens/colors.dart';
import 'app_home.dart';
import 'tokens/theme_data.dart';
// Localization
import 'l10n/l10n.dart';
//import 'flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
// for the json
import 'dart:convert';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState(){
    getCurrentAppTheme();
    super.initState();
    // TODO: Call the initialization of the data models through the json
    // Testing in the Penalties tab page
    // readJson();
    // initSanctionFromJson();

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          themeProvider.darkTheme;
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeProvider.darkTheme),
            home: CupertinoDivingRulesApp(),

            // Localization setup
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        }
      ),
    );
  }
}


// TODO: Manage user language selection
// from https://docs.flutter.dev/development/accessibility-and-localization/internationalization
// To get the current localization
// Locale myLocale = Localizations.localeOf(context);

// To manually set the language
// locale: const Locale('es'),