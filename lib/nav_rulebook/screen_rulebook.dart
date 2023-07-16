import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ScreenRulebook extends StatefulWidget {
  const ScreenRulebook({Key? key}) : super(key: key);

  @override
  State<ScreenRulebook> createState() => _ScreenRulebookState();
}

class _ScreenRulebookState extends State<ScreenRulebook> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(AppLocalizations.of(context)!.cFBundleName),
        //   backgroundColor: Colors.blue,
        // ),

        // TODO: CURRENT >>> Add the spanish version of the rulebook
        body: Center(
            child: myLocale.languageCode == 'fr'
                ? SfPdfViewer.asset(
                    'assets/rulebooks/2022-2025_Reglement-WA-Plongeon-v2_fr.pdf')
                : myLocale.languageCode == 'es'
                    ? SfPdfViewer.asset(
                        'assets/rulebooks/2022-2025_WA_Reglamento_Saltos_ES.pdf')
                    : SfPdfViewer.asset(
                        'assets/rulebooks/2022-2025_World-Aquatics-Diving-Rules_en.pdf')));
  }
}

// en - English (plus 8 country variations)
// es - Spanish Castilian (plus 20 country variations)
// fr - French (plus one country variation)
// it - Italian
// Other supported languages: https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html
