import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/token_spacing.dart';
import 'diving_rules_localizations.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      child: PopupMenuButton<String>(
        onSelected: (item) => handleClick(item),
        // TODO Translation text
        tooltip: AppLocalizations.of(context)!.languageSelection,
        icon: const Icon(CupertinoIcons.globe), // Icon(Icons.language),
        itemBuilder: (context) => [
          PopupMenuItem<String>(
              value: "en",
              child: Row(
                children: [
                  const Text(
                    "🇬🇧",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: DRSpacing.s),
                  const Text("English")
                ],
              )),
          PopupMenuItem<String>(
              value: "fr",
              child: Row(
                children: [
                  const Text(
                    "🇫🇷",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: DRSpacing.s),
                  const Text("Français")
                ],
              )),
          PopupMenuItem<String>(
              value: "es",
              child: Row(
                children: [
                  const Text(
                    "🇪🇸",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: DRSpacing.s),
                  const Text("Español")
                ],
              )),
          PopupMenuItem<String>(
              value: "it",
              child: Row(
                children: [
                  const Text(
                    "🇮🇹",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: DRSpacing.s),
                  const Text("Italiano")
                ],
              )),
          PopupMenuItem<String>(
              value: "de",
              child: Row(
                children: [
                  const Text(
                    "🇩🇪",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: DRSpacing.s),
                  const Text("Deutsch")
                ],
              )),
          PopupMenuItem<String>(
              value: "MX",
              child: Row(
                children: [
                  const Text(
                    "🇲🇽",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: DRSpacing.s),
                  const Text("Mexicano")
                ],
              )),
        ],
      ),
    );
  }

  void handleClick(String item) {
    // changes the local app language
    Locale tempLocale;
    // debugPrint('>>>>> Language_selector > before click: languageCode: ${Localizations.localeOf(context).languageCode} - countryCode: ${Localizations.localeOf(context).countryCode}');
    switch (item) {
      case 'en':
        tempLocale = const Locale('en', 'US');
        break;
      case 'fr':
        tempLocale = const Locale('fr', 'FR');
        break;
      case 'es':
        tempLocale = const Locale('es', 'ES');
        break;
      case 'MX':
        tempLocale = const Locale('es', 'MX');
        break;
      case 'it':
        tempLocale = const Locale('it', 'IT');
        break;
      case 'de':
        tempLocale = const Locale('de', 'DE');
        break;
      default:
        tempLocale = const Locale('en', 'US');
    }
    // debugPrint('>>>>> Language_selector > before click: _tempLocale.languageCode: ${_tempLocale.languageCode} - _tempLocale.countryCode: ${_tempLocale.countryCode}');

    setState(() {
      Get.updateLocale(tempLocale);
      // Test current Local
    });
  }
}
