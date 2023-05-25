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
        body: Center(
            child: myLocale.languageCode == 'fr'
                ? SfPdfViewer.asset(
                    'assets/rulebooks/2022-2025_Reglement-WA-Plongeon-v2_fr.pdf')
                : SfPdfViewer.asset(
                    'assets/rulebooks/2022-2025_World-Aquatics-Diving-Rules_en.pdf')));
  }
}
