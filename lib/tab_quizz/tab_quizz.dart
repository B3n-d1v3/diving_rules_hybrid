import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import '../tokens/colors.dart';

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
          onPressed: () {
            setState(() {
              themeState.darkTheme = !themeState.darkTheme;
              // themeModeSwitch = !themeModeSwitch;
            });
          },
          padding: EdgeInsets.zero,
          child: Icon(
              themeState.darkTheme ? CupertinoIcons.moon_stars_fill : CupertinoIcons.brightness_solid
          ),
        ),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                Center(
                  child: Text(AppLocalizations.of(context)!.quizzIntroDescription),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,25,0,10),
                  child: Divider(
                    height: 10,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                    color: themeState.darkTheme ? AppColor.myPrimaryColorDark : AppColor.myPrimaryColorLight,
                  ),
                ),
                Text("XXXXX Another text for testing XXXX"),
                Image.asset(
                  'assets/images/diving-rules-logo-white.png',
                  height: 200,
                ),
                // Testing insertion
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.aboutVersion,
                          // TODO: This is the parameter that makes the text not visible in dark mode
                          //style: Theme.of(context).textTheme.labelMedium,
                          textAlign: TextAlign.start,
                        ),
                        Text ("v (build )",
                          //style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ]
                  ),
                ),

                // Test font styles in dark mode
                // TODO: find a way to use these default styles in dark mode
                Divider(
                  height: 10,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: themeState.darkTheme ? AppColor.myPrimaryColorDark : AppColor.myPrimaryColorLight,
                ),
                Text(
                  'displayLarge',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  'displayMedium',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  'displaySmall',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Divider(
                  height: 10,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: themeState.darkTheme ? AppColor.myPrimaryColorDark : AppColor.myPrimaryColorLight,
                ),
                Text(
                  'headlineLarge',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'headlineMedium',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'headlineSmall',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Divider(
                  height: 10,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: themeState.darkTheme ? AppColor.myPrimaryColorDark : AppColor.myPrimaryColorLight,
                ),Text(
                  'titleLarge',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'titleMedium',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'titleSmall',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Divider(
                  height: 10,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: themeState.darkTheme ? AppColor.myPrimaryColorDark : AppColor.myPrimaryColorLight,
                ),
                Text(
                  'bodyLarge',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'bodyMedium',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                        'bodySmall',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                Divider(
                  height: 10,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: themeState.darkTheme ? AppColor.myPrimaryColorDark : AppColor.myPrimaryColorLight,
                ),
                Text(
                  'labelLarge',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'labelMedium',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  'labelSmall',
                  style: Theme.of(context).textTheme.labelSmall,
                ),




                  // end of test font style in dark mode


                // Testing insetion end
  ]), ), ), ), ),
    );
  }
}

// Note for later: to manage the navigation back use the following code:
// Navigator.pop(context);