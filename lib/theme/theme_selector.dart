import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model_theme.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  String themeValue = ThemeMode.system.toString();

  final Map<String, IconData> themeIcons = {
    ThemeMode.light.toString(): CupertinoIcons.sun_max_fill, // Icons.wb_sunny,
    ThemeMode.dark.toString():
        CupertinoIcons.moon_stars_fill, // Icons.nightlight_round,
    ThemeMode.system.toString():
        CupertinoIcons.square_line_vertical_square_fill, // Icons.circle_sharp,
  };

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ModelTheme>(context);
    // correct the mode to set auto by default and to include the auto in the switch

    return
        // Semantics(
        // button: true,
        // label: themeNotifier.themeMode == ThemeMode.light
        //     ? AppLocalizations.of(context)!.themeSelectorSwitchDarkMode
        //     : AppLocalizations.of(context)!.themeSelectorSwitchLightMode,
        // child:
        IconButton(
            icon: Icon(themeNotifier.themeMode == ThemeMode.light
                    ? CupertinoIcons.sun_max_fill //Icons.light_mode
                    : CupertinoIcons.moon_stars_fill //Icons.dark_mode
                ),
            onPressed: () {
              setState(() {
                themeNotifier.themeMode =
                    themeNotifier.themeMode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              });
            },
            tooltip: themeNotifier.themeMode == ThemeMode.light
                ? "Dark" // AppLocalizations.of(context)!.themeSelectorSwitchDarkMode
                : "Light" // AppLocalizations.of(context)!.themeSelectorSwitchLightMode,
            //    ), // Semantics
            );
  }
}
