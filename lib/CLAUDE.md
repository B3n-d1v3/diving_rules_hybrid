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

- Entry point `lib/main.dart` sets up `GetMaterialApp` (GetX for navigation/routing) with named routes (`/`, `/rulebook`, `/penalties`, `/quiz`, `/checklist`, `/about`) and wires localization delegates + the `ModelTheme` (light/dark) provider.
- `lib/app_home_m3.dart` (`DivingRulesMainScreen`) is the actual app shell: it owns the bottom navigation bar (mobile) / `NavigationRail` (wider viewports, breakpoint `mobileUiMaxScreenWidth = 640`) and swaps between four tab screens: Rules (`nav_rulebook`), Checklist (`nav_checklist/screen_checklist_menu.dart`), Quiz (`nav_quiz`), About (`nav_about`). `nav_penalty_list` is no longer a tab — `ScreenPenaltyList` (and `ScreenChecklist`/`ScreenAssistantRefereeChecklist`) are now reached only by pushing from the Checklist menu (see below), so each has grown its own `AppBar` (title + `ActionSearch`/`LanguageSelector`/`ThemeSelector`) instead of relying on the shell's.
- State management is a mix of `provider` (theme, via `ChangeNotifierProvider`/`Consumer<ModelTheme>` — see `lib/theme/model_theme.dart`) and `GetX` reactive state (`.obs`/`Rx*` types, `Get.put`) for quiz/question interaction state — see `currentPenaltyStatus` (a `Get.put(ButtonsStatus())` singleton in `globals.dart`) mutated throughout `lib/models/quiz_button_status.dart`. There is no single unifying state pattern across the app; check the surrounding file before introducing new state.
- Quiz flow: `lib/models/quiz_model.dart`'s `newQuiz()` picks `quizTotalQuestionNumber` random unique penalty ids into `currentQuiz` (a `Quiz` held in `globals.dart`); `lib/nav_quiz/screen_quiz_question.dart` drives one question at a time against the shared `ButtonsStatus` object, `logUserAnswer()` records the user's picks as a `Penalty` into `currentQuiz.answers`, and `screen_quiz_result.dart` / `screen_quiz_correction_list.dart` score and review it against the real penalty data. There's no persisted quiz history yet (`quizzHistory` from the README's data model is not implemented).
- `lib/nav_checklist/screen_checklist_menu.dart` (`ScreenChecklistMenu`) is the Checklist tab's content: a 3-item list — labels `checklistMenuReferee` ("Referee's Duties"), `checklistMenuAssistantReferee` ("Assistant Referee's Duties"), `checklistMenuJudgePenalties` ("Judge penalties") — each pushing (`Get.to`) its destination screen; those same 3 strings double as each pushed screen's `AppBar` title. `screen_checklist.dart` and `screen_checklist_assistant_referee.dart` render their respective duties as collapsible sections (Referee: before/during an event, before/during a dive, after an event; Assistant Referee: shared duties, platform, synchronised diving), each a static, always-checked, non-interactive list of actions (sourced from Sections 6, 8, 10 and 11 of the English rulebook PDF — see `lib/nav_checklist/CONTENT_NOTES.md` for the full draft with rule references). Rather than one `.arb` key per item, each section's items are stored as a single localized string (`checklistBeforeEventItems`, `checklistPlatformItems`, etc.) with one item per line, split on `\n` at render time. `lib/nav_penalty_list/screen_penalty_list.dart` uses the same collapsible-section look, grouping the 63 penalties into the 6 sanction categories (0 pts, max 2 pts, max 4½ pts, -2 pts, -½ to 2 pts, judge's opinion), in the same order as the sanction table on the penalty detail page.
- `lib/sub_views/collapsible_section.dart` (`CollapsibleSection`) is the shared collapsible-section widget behind all three checklist-style pages above: a tappable header tinted with `colorScheme.secondaryContainer` inside a `colorScheme.secondary`-outlined rounded card (border and fill share one `ClipRRect`-clipped `BorderRadius` so they can't drift apart), expanding to reveal arbitrary `children` on the plain surface background, separated by `Divider()`s. It takes a `title` and `children` (any widgets — `CheckboxListTile`s for checklists, `ListTile`s for penalties), not checklist-specific data, so new collapsible-list screens should reuse it rather than hand-rolling `ExpansionTile`.
- Every checklist page has a `titleLarge` subtitle above its sections (`checklistSubtitle`, `checklistAssistantSubtitle`, `penaltiesSubtitle`), and the surrounding `ListView`/scroll content is padded with `DRSpacing.l` on all sides to match — keep new checklist-style screens consistent with both.
- Article citations inside the checklist `*Items` strings are written against the 2026 English/French rulebook edition's numbering; since the bundled es/es_mx/it/de rulebook PDFs are older editions with different (or no) article numbers, their citations are prefixed `Art. EN 8.3.1` (English reference, not a local citation) rather than left unprefixed like the en/fr strings — keep this prefix convention if more checklist content is added in those languages.
- Reusable button/selector widgets (penalty sanction buttons, ownership toggles, correction icons) live in `lib/buttons/`; shared small views (search, logo, collapsible section) in `lib/sub_views/`.
- Theming lives entirely under `lib/theme/`: `dr_colors.dart`/`dr_color_scheme.dart` define the palette, `dr_typography.dart` the text styles, `dr_theme.dart` assembles `ThemeData` for light/dark, and `theme_preference.dart`/`model_theme.dart` persist the user's chosen `ThemeMode` via `shared_preferences`.

## Versioning

App version follows `pubspec.yaml`'s `version:` field (`major.minor.patch+buildNumber`); the comment block directly below it in `pubspec.yaml` is a manually maintained changelog — add an entry there when bumping the version.
