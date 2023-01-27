import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

class CupertinoTabQuizz extends StatefulWidget {
  const CupertinoTabQuizz({Key? key}) : super(key: key);

  @override
  _CupertinoTabQuizzState createState() =>
      _CupertinoTabQuizzState();
}

class _CupertinoTabQuizzState extends State<CupertinoTabQuizz> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.quizzTitle),

        // Header trailing functions: Light/Dark switch + Language Selection
        trailing: CupertinoButton(
          child: Icon(
              themeState.darkTheme ? CupertinoIcons.moon_stars_fill : CupertinoIcons.brightness_solid
          ),
          onPressed: () {
            setState(() {
              themeState.darkTheme = !themeState.darkTheme;
              // themeModeSwitch = !themeModeSwitch;
            });
          },
          padding: EdgeInsets.zero,
        ),
      ),
      child: Center(
        child: Text(AppLocalizations.of(context)!.quizzIntroDescription),
      ),
    );
  }
}