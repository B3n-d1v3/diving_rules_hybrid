import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';

import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

class CupertinoTabAbout extends StatefulWidget {
  const CupertinoTabAbout({Key? key}) : super(key: key);

  @override
  _CupertinoTabAboutState createState() =>
      _CupertinoTabAboutState();
}

class _CupertinoTabAboutState extends State<CupertinoTabAbout> {
  // bool themeModeSwitch = true;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.aboutTitle),

        // trailing: SwitchListTile(
        //     value: false,
        //     onChanged: (bool value) {
        //       themeState.darkTheme = value;
        //     }
        // ),

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
        child: Text(AppLocalizations.of(context)!.aboutDescription),
      ),
    );
  }
}
