import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ScreenRulebook extends StatefulWidget {
  const ScreenRulebook({Key? key}) : super(key: key);

  @override
  State<ScreenRulebook> createState() => _ScreenRulebookState();
}

class _ScreenRulebookState extends State<ScreenRulebook> {
  late PdfViewerController _pdfViewerController;

  // late PdfTextSearchResult _searchResult;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    // _searchResult = PdfTextSearchResult();
    super.initState();
  }

  void _showContextMenu(
      BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState _overlayState = Overlay.of(context)!;
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        left: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          onPressed: () {
            Clipboard.setData(
                ClipboardData(text: details.selectedText.toString()));
            // debugPrint('Text copied to clipboard: ' + details.selectedText.toString());
            _pdfViewerController.clearSelection();
          },
          // make translation
          child: Text(
            AppLocalizations.of(context)!.rulebookCopy,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
    _overlayState.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    // String rulebookUrl = 'assets/rulebooks/2022-2025_World-Aquatics-Diving-Rules_en.pdf';
    // debugPrint('>>>>> ScreenRulebook > myLocale.languageCode: ${myLocale.languageCode} - myLocale.countryCode: ${myLocale.countryCode}');

    getRulebookUrl(Locale appLocale) {
      // Select the document to be displayed in the pdf viewer based on the selected locale
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
      // debugPrint('>>>>> ScreenRulebook > getRulebookUrl > tempUrl: ${tempUrl} ');
      return tempUrl;
    }

    return Scaffold(
        body: Center(
            child: SfPdfViewer.asset(
      getRulebookUrl(myLocale),
      enableTextSelection: true,
      onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
        if (details.selectedText == null && _overlayEntry != null) {
          _overlayEntry!.remove();
          _overlayEntry = null;
        } else if (details.selectedText != null && _overlayEntry == null) {
          _showContextMenu(context, details);
        }
      },
      controller: _pdfViewerController,
    )));
  }
}
