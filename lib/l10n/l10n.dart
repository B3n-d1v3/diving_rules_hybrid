import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// regenerate translation files - in terminal: "flutter gen-l10n"

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('fr'),
    const Locale('it'),
    const Locale('es'),
    // const Locale('es_419'),
    // const Locale('es', 'MX'),
    const Locale.fromSubtags(languageCode: 'es', countryCode: 'MX')
  ];
}

// Other supported languages: https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html
