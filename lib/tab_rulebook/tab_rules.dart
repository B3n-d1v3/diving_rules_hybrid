import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

class CupertinoTabRules extends StatefulWidget {
  const CupertinoTabRules({Key? key}) : super(key: key);

  @override
  _CupertinoTabRulesState createState() =>
      _CupertinoTabRulesState();
}

class _CupertinoTabRulesState extends State<CupertinoTabRules> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.cFBundleName),

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
        // TODO: Select the Rule Book of the right localization
        // Locale myLocale = Localizations.localeOf(context);
         child: SfPdfViewer.asset('assets/rulebooks/2022-2025_FINA_EN_Diving-Technical-Rules.pdf')
          //child: SfPdfViewer.asset('assets/rulebooks/2022-2025_Reglement-WA-Plongeon-FR_v1.pdf')
        )
      );
  }
}