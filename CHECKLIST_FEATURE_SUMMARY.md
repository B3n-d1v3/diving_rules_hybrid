# Checklist feature — conversation summary & reusable playbook

This document summarizes an extended conversation in which the "Checklist" feature was
designed and built from scratch in the Diving Rules app. It's written to be pasted into a
**new** conversation as context/instructions when building a similarly-shaped feature
(a localized, content-heavy, navigational screen sourced from the official rulebook PDFs) —
not as a log of this specific feature's content.

## What was built (end state)

- The bottom nav went from 5 tabs to **4**: Rules, **Checklist**, Quiz, About. "Penalties" is
  no longer a standalone tab.
- The Checklist tab opens a 3-item selector (`ScreenChecklistMenu`), each item pushing a
  destination screen:
  1. **Referee's Duties** (`ScreenChecklist`) — 5 collapsible sections (before/during an
     event, before/during a dive, after an event), each a static, always-checked,
     non-interactive list of referee actions.
  2. **Assistant Referee's Duties** (`ScreenAssistantRefereeChecklist`) — 3 sections (shared
     duties, platform, synchronised diving), same static-checklist presentation.
  3. **Judge penalties** (`ScreenPenaltyList`, the pre-existing penalty list) — regrouped into
     6 collapsible sections by sanction category (0 pts, max 2 pts, max 4½ pts, -2 pts,
     -½ to 2 pts, judge's opinion), same order as the sanction table on the penalty detail page.
- All three pages share one visual language: a subtitle line, then a list of
  `CollapsibleSection` cards (tinted/outlined header, plain-background content, dividers
  between items) — see `lib/sub_views/collapsible_section.dart`.
- Content for the two duties checklists is fully translated into all 6 app languages
  (en, fr, es, es_mx, it, de), sourced from each language's own official rulebook PDF where
  available, not machine-translated from English.

## Process that produced it (the reusable part)

### 1. Structure first, content later

The user explicitly sequenced the work: get the page skeleton, navigation, and interaction
model right with **lorem ipsum / placeholder** content before touching real rulebook content.
Only once the structure was approved did research into the actual rule text begin. When
building a similar feature, follow the same order — don't let content research block or
tangle with UI/UX iteration.

### 2. Content sourcing from primary documents

- The app bundles official rulebook PDFs per language in `assets/rulebooks/`. When a feature
  needs real regulatory content, extract text with `pdftotext -layout <pdf> out.txt` (requires
  `brew install poppler`) rather than summarizing from general knowledge.
- **Check edition/numbering alignment before translating.** In this feature, English and
  French shared the same 2026 edition and article numbers; Spanish, Spanish (Mexico), and
  Italian used an older 2022–2025 edition with different "D-section" numbering; German used a
  much older 2018 edition with yet another (`§`-paragraph) scheme. Don't assume a citation
  number is portable across language PDFs — check first, then ask the user how to handle the
  mismatch (options offered here: find each edition's own citation / drop citations for the
  mismatched languages / keep one reference language's numbers everywhere with a language
  prefix). The user chose the third option, hence the `Art. EN 8.3.1` prefix convention in
  `es`/`es_mx`/`it`/`de` — see CLAUDE.md.
- When translating regulatory content, pull actual terminology from each language's own
  existing strings in the codebase first (e.g. grep `buttonReferee`, `penaltyNN` keys) so new
  content matches established in-app vocabulary (e.g. Spain's "Juez Árbitro" vs Mexico's
  "Árbitro"; Italian "Giudice Arbitro"; German "Schiedsrichter").
- Iterate on content in small, reviewable batches: propose a list in plain text/chat first,
  let the user correct specific lettered items ("check 2c", "drop 3d/3f/3g", "detail 1b using
  the actual source text instead of a generic article reference"), *then* wire the approved
  version into code/l10n. Don't go straight from PDF text to shipped `.arb` strings.

### 3. Localization conventions established

- **Shared strings across a list item and its destination screen's AppBar title.** The 3
  menu item labels (`checklistMenuReferee`, `checklistMenuAssistantReferee`,
  `checklistMenuJudgePenalties`) are reused verbatim as both the selector's list text and the
  pushed screen's `AppBar` title — one key, two call sites, always in sync.
- **One localized string per section, not per item.** Rather than one `.arb` key per checklist
  line (which would explode the key count and complicate reordering), each section's items are
  stored as a single string with one item per line, split on `\n` at render time
  (`_splitChecklistItems` helper in both checklist screens). Reuse this pattern for any
  future "list of many short localized items grouped into sections" content.
- Every new locale key was added to **all 6** `.arb` files in the same edit (never left
  missing in a subset), using real translations where the source material existed, and only
  falling back to an English placeholder transiently — always regenerate with
  `fvm flutter gen-l10n` and verify JSON parses (`python3 -c "import json; json.load(open(...))"`)
  after each batch edit.

### 4. UI/visual iteration — what got corrected, and why

Several rounds of feedback shaped the final look; the lessons generalize to any collapsible/
sectioned list UI in this app:

- Started with a raw `ExpansionTile` for each section using `backgroundColor` /
  `collapsedBackgroundColor` — the user found this made *item content* hard to read against a
  tinted background and asked for the tint to apply to the **header only**, with items back on
  the normal surface color, plus an outline to delineate the section, and dividers between
  items "as on the penalties page" (i.e. matching an existing `Divider()` convention rather
  than inventing a new one).
- The resulting custom widget (`Container` + `BoxDecoration` border + child `Column`) had a
  known Flutter pitfall: the painted border and the `Container`'s own `clipBehavior`-driven
  fill can round differently, producing a barely-visible mismatch between the outline and the
  tinted header's corners. Fix: paint the border on the outer `Container`'s `BoxDecoration`,
  but clip the *content* with an explicit `ClipRRect` using the exact same `BorderRadius`
  instance, so both share identical geometry instead of two independently-computed roundings.
- The widget was built once for the checklist pages, then **generalized** (renamed
  `ChecklistSection` → `CollapsibleSection`, moved from `lib/nav_checklist/` to the shared
  `lib/sub_views/`, and changed from a `List<String> items` API to a `List<Widget> children`
  API) the moment a second, structurally-different use case appeared (grouping penalties by
  sanction, which needed `ListTile`+chevron+navigation rows, not checkboxes). Don't
  special-case a second consumer of a one-off widget — generalize it.
- Later fixes were about consistency, not novelty: matching page-edge padding
  (`ListView(padding: EdgeInsets.all(DRSpacing.l))`) and adding a `titleLarge` subtitle above
  the sections, because a newly-restructured page (Judge Penalties) had silently drifted from
  the padding/subtitle conventions already established on the sibling duties pages. When
  restructuring an existing screen to match a new pattern, diff it against the sibling
  screens that already use that pattern, not just against its own "did it get better" bar.

### 5. Verification discipline

Every change in this feature was verified the same way before being reported done:
1. `fvm flutter analyze <changed dirs>` — confirm no new errors/warnings vs. baseline.
2. `fvm flutter gen-l10n` after any `.arb` edit, plus a Python JSON-parse check on every
   touched locale file.
3. Launch on a real device/emulator (`fvm flutter run -d <device>`), navigate to the actual
   screen with `adb`/`uiautomator`, and screenshot it — for a localization change, this
   included switching the in-app language picker and re-screenshotting, not just trusting
   that the translated string "looks right" in the source file.
4. Only after a screenshot matched the request was the change reported complete.

## Key files (for reference when reading this later)

- `lib/nav_checklist/screen_checklist_menu.dart` — the 3-item selector.
- `lib/nav_checklist/screen_checklist.dart`, `screen_checklist_assistant_referee.dart` — the
  two duties checklists.
- `lib/nav_checklist/CONTENT_NOTES.md` — the rulebook-sourced content draft (English), with
  article references, kept in sync with the shipped `.arb` strings.
- `lib/nav_penalty_list/screen_penalty_list.dart` — penalties regrouped by sanction.
- `lib/sub_views/collapsible_section.dart` — the shared section widget.
- `lib/l10n/diving_rules_<locale>.arb` — all checklist/penalty-subtitle strings, 6 locales.
- `CLAUDE.md` — architecture notes updated alongside this feature; read it for the current
  (non-historical) state of the codebase.

## How to reuse this as a prompt

If asked to build another content-heavy, rulebook-sourced, multi-language screen, bring in:
"Read `CHECKLIST_FEATURE_SUMMARY.md` for the process and conventions used to build the
Checklist feature (PDF-sourcing method, per-language edition/citation handling, the
`CollapsibleSection` widget, the one-string-per-section l10n pattern, and the verification
steps), and apply the same approach to `<new feature description>`."
