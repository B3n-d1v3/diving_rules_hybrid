class AppLanguage {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  AppLanguage(this.id, this.name, this.flag, this.languageCode);

  static List<AppLanguage> languageList() {
    return <AppLanguage>[
      AppLanguage(1, "English", "🇺🇸", "en"),
      AppLanguage(2, "Français", "🇫🇷", "fr"),
      AppLanguage(3, "Español", "🇪🇸", "es"),
      AppLanguage(4, "Italiano", "🇮🇹", "it"),
      AppLanguage(5, "Latam", "🇲🇽", "es_419"),
      // language iso codes: http://lingoes.net/en/translator/langcode.htm
    ];
  }
}

// add new language, run
