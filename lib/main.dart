import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'tokens/colors.dart';
import 'app_home.dart';
import 'tokens/theme_data.dart';


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
          );
        }
      ),
    );
  }
}
