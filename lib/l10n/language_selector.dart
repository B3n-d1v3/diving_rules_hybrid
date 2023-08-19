import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/token_spacing.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    // TODO: CURRENT >>> Show the actions in the detailed pages of the app
    return Container(
      width: 28,
      child: PopupMenuButton<String>(
          onSelected: (item) => handleClick(item),
          tooltip: "language",
          icon: const Icon(Icons.language),
          itemBuilder: (context) => [
                PopupMenuItem<String>(
                    value: "en",
                    child: Row(
                      children: [
                        const Text(
                          "🇺🇸",
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
              ]),
    );
  }

  void handleClick(String item) {
    // changes the local app language
    Locale _tempLocale;
    switch (item) {
      case 'en':
        _tempLocale = const Locale('en', 'US');
        break;
      case 'fr':
        _tempLocale = const Locale('fr', 'FR');
        break;
      case 'es':
        _tempLocale = const Locale('es', 'ES');
        break;
      case 'it':
        _tempLocale = const Locale('it', 'IT');
        break;
      default:
        _tempLocale = const Locale('en', 'US');
    }
    setState(() {
      Get.updateLocale(_tempLocale);
    });
  }
}
