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
    // String rulebookUrl = 'assets/rulebooks/2022-2025_World-Aquatics-Diving-Rules_en.pdf';
    // debugPrint('>>>>> ScreenRulebook > myLocale.languageCode: ${myLocale.languageCode} - myLocale.countryCode: ${myLocale.countryCode}');

    getRulebookUrl(Locale appLocale) {
      String tempUrl =
          'assets/rulebooks/2022-2025_World-Aquatics-Diving-Rules_en.pdf';
      appLocale.languageCode == 'fr'
          ? tempUrl =
              'assets/rulebooks/2022-2025_Reglement-WA-Plongeon-v2_fr.pdf'
          : appLocale.languageCode == 'es'
              ? appLocale.countryCode == 'MX'
                  ? tempUrl =
                      'assets/rulebooks/2022-2025_Reglas-WA-Clavados-FMN_es_MX.pdf'
                  : tempUrl =
                      'assets/rulebooks/2022-2025_WA_Reglamento_Saltos_es.pdf'
              // Add Italian rulebook here
              // : appLocale.languageCode == 'it'
              //     ? tempUrl = 'assets/rulebooks/2022-2025_xxxxxxx_it.pdf')
              : tempUrl =
                  'assets/rulebooks/2022-2025_World-Aquatics-Diving-Rules_en.pdf';
      debugPrint(
          '>>>>> ScreenRulebook > getRulebookUrl > tempUrl: ${tempUrl} ');
      return tempUrl;
    }

    return Scaffold(
        body: Center(
            child: SfPdfViewer.asset(
      getRulebookUrl(myLocale),
      enableTextSelection: true,
    )));
  }
}
