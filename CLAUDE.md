# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Diving Rules is a Flutter mobile/desktop app that helps diving judges and referees learn the World Aquatics (FINA) diving rules: it shows the official rulebook PDF, lists all penalties with their sanctions/ownership, and runs quizzes on that penalty data. Targets iOS, Android, and macOS.

## Commands

The Flutter SDK version is pinned via FVM (`.fvmrc` → `3.44.0`, symlinked at `.fvm/flutter_sdk`). Prefer `fvm flutter` over a bare `flutter` to guarantee the right SDK version:

```bash
fvm flutter pub get                 # install dependencies
fvm flutter analyze                 # static analysis / lints (flutter_lints via analysis_options.yaml)
fvm flutter test                    # run tests
fvm flutter test test/widget_test.dart   # run a single test file
fvm flutter run                     # run on a connected device/simulator
fvm flutter gen-l10n                # regenerate lib/l10n/diving_rules_localizations*.dart from the .arb files
```

Note: `test/widget_test.dart` is the unmodified Flutter project template (it references a nonexistent `MyApp` counter widget, not the real `DivingRulesApp`) — it does not currently exercise app functionality. There is no CI workflow in this repo.

## Localization workflow

- Source strings live in `lib/l10n/diving_rules_<locale>.arb` (`en`, `fr`, `es`, `es_mx`, `it`, `de`); `diving_rules_en.arb` is the template (`l10n.yaml`).
- Generated Dart (`diving_rules_localizations*.dart`) is produced by `flutter gen-l10n` — **do not hand-edit these files**, edit the `.arb` source and regenerate.
- Supported/enabled locales for the running app are controlled separately in `lib/l10n/l10n.dart` (`L10n.all`) — adding a translation file does not enable it in-app until it's added there too.
- Real-world translations are managed externally via POEditor and pulled back into the `.arb` files.
- Per-penalty descriptions are localized strings named `penalty0`, `penalty1`, ... (one key per numeric penalty id) rendered by `lib/l10n/penalty_description_l10n.dart`'s `PenaltyDescription` widget, which switches on `penaltyId`. When a new penalty is added to the data (see below), a matching `penaltyN` key must be added to every `.arb` file and a case added to that switch.

## Data model & content

Penalty and sanction content is data-driven from bundled JSON, not hardcoded, and is loaded once at startup in `app_home_m3.dart` (`_DivingRulesMainScreenState.initState` → `getSanctions` / `getPenalties`) into global singletons in `lib/models/globals.dart` (`penaltySummary`, `sanctionItems`):

- `assets/data/divingPenaltiesSummary.json` → `PenaltySummary`/`Penalty` (`lib/models/penalty_model.dart`): each penalty has an `id`, the rulebook `rules` it references, a `sanctionValue` (0–5, see below), and `referee`/`judge` ownership booleans. The penalty's human-readable `description` field in the JSON is a reference copy only — the actual UI text comes from localization (`penaltyN` keys), so JSON and `.arb` files must be kept in sync manually.
- `assets/data/divingPenaltiesSanctions.json` → `SanctionItems`/`Sanction` (`lib/models/sanction_model.dart`): the 6 sanction categories (icon + button text key) that a `sanctionValue` maps to.
- The `sanctionValue`/`penaltyNb` mapping is fixed across the codebase: `0`=zero points, `1`=minus 2 pts, `2`=max 2 pts, `3`=max 4½ pts, `4`=minus ½–2 pts, `5`=judge's opinion. This mapping is duplicated (magic numbers) in `sanction_model.dart`'s `setPenaltySanction`/switches, `models/quiz_button_status.dart`, and the button widgets in `lib/buttons/` — if you change the mapping or add a category, update all of them.
- `assets/rulebooks/*.pdf` holds the localized rulebook PDFs shown by `lib/nav_rulebook/screen_rulebook.dart` (via `syncfusion_flutter_pdfviewer`); filenames encode the source date/locale, e.g. `2026-02-18_..._fr.pdf`.

## App architecture

- Entry point `lib/main.dart` sets up `GetMaterialApp` (GetX for navigation/routing) with named routes (`/`, `/rulebook`, `/penalties`, `/quiz`, `/about`) and wires localization delegates + the `ModelTheme` (light/dark) provider.
- `lib/app_home_m3.dart` (`DivingRulesMainScreen`) is the actual app shell: it owns the bottom navigation bar (mobile) / `NavigationRail` (wider viewports, breakpoint `mobileUiMaxScreenWidth = 640`) and swaps between the four tab screens, each living in its own `lib/nav_*` folder (`nav_rulebook`, `nav_penalty_list`, `nav_quiz`, `nav_about`).
- State management is a mix of `provider` (theme, via `ChangeNotifierProvider`/`Consumer<ModelTheme>` — see `lib/theme/model_theme.dart`) and `GetX` reactive state (`.obs`/`Rx*` types, `Get.put`) for quiz/question interaction state — see `currentPenaltyStatus` (a `Get.put(ButtonsStatus())` singleton in `globals.dart`) mutated throughout `lib/models/quiz_button_status.dart`. There is no single unifying state pattern across the app; check the surrounding file before introducing new state.
- Quiz flow: `lib/models/quiz_model.dart`'s `newQuiz()` picks `quizTotalQuestionNumber` random unique penalty ids into `currentQuiz` (a `Quiz` held in `globals.dart`); `lib/nav_quiz/screen_quiz_question.dart` drives one question at a time against the shared `ButtonsStatus` object, `logUserAnswer()` records the user's picks as a `Penalty` into `currentQuiz.answers`, and `screen_quiz_result.dart` / `screen_quiz_correction_list.dart` score and review it against the real penalty data. There's no persisted quiz history yet (`quizzHistory` from the README's data model is not implemented).
- Reusable button/selector widgets (penalty sanction buttons, ownership toggles, correction icons) live in `lib/buttons/`; shared small views (search, logo) in `lib/sub_views/`.
- Theming lives entirely under `lib/theme/`: `dr_colors.dart`/`dr_color_scheme.dart` define the palette, `dr_typography.dart` the text styles, `dr_theme.dart` assembles `ThemeData` for light/dark, and `theme_preference.dart`/`model_theme.dart` persist the user's chosen `ThemeMode` via `shared_preferences`.

## Versioning

App version follows `pubspec.yaml`'s `version:` field (`major.minor.patch+buildNumber`); the comment block directly below it in `pubspec.yaml` is a manually maintained changelog — add an entry there when bumping the version.
