import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

class CupertinoTabPenalties extends StatefulWidget {
  const CupertinoTabPenalties({Key? key}) : super(key: key);

  @override
  _CupertinoTabPenaltiesState createState() =>
      _CupertinoTabPenaltiesState();
}

class _CupertinoTabPenaltiesState extends State<CupertinoTabPenalties> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.penaltiesListTitle),

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
      child: container(
        // Retrieves the screen size
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(
          children: [
            Text('An individual penalty description'),
            Row(
              // set all row elements evenly in the available width
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Add the penalties (0pts, max 2 pts...) or the owner of the penalty(judge/referee)
                Text('0 pts'),
                Text('max 2 pts'),
                Text('Max 4.5 pts'),
              ],
            ),
          ],
        ),
        // debugPrint("Test terxt in console");
      ),
    );
  }
}