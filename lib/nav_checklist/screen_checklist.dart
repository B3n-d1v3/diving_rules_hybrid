import 'package:flutter/material.dart';

import '../l10n/action_language_selector.dart';
import '../l10n/diving_rules_localizations.dart';
import '../models/globals.dart';
import '../models/token_spacing.dart';
import '../sub_views/action_search.dart';
import '../sub_views/collapsible_section.dart';
import '../theme/action_theme_selector.dart';

// Each *Items localized string holds one referee action per line; this
// splits it back into the individual checklist entries at render time.
List<String> _splitChecklistItems(String rawItems) => rawItems
    .split('\n')
    .map((item) => item.trim())
    .where((item) => item.isNotEmpty)
    .toList();

class ScreenChecklist extends StatefulWidget {
  const ScreenChecklist({super.key});

  @override
  State<ScreenChecklist> createState() => _ScreenChecklistState();
}

class _ScreenChecklistState extends State<ScreenChecklist> {
  @override
  void initState() {
    // could be 'start', 'rulebook', 'penalties', 'quiz', 'checklist', 'about'
    currentPage = 'checklist';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final sections = [
      (
        title: localizations.checklistBeforeEvent,
        items: _splitChecklistItems(localizations.checklistBeforeEventItems),
      ),
      (
        title: localizations.checklistDuringEvent,
        items: _splitChecklistItems(localizations.checklistDuringEventItems),
      ),
      (
        title: localizations.checklistBeforeDive,
        items: _splitChecklistItems(localizations.checklistBeforeDiveItems),
      ),
      (
        title: localizations.checklistDuringDive,
        items: _splitChecklistItems(localizations.checklistDuringDiveItems),
      ),
      (
        title: localizations.checklistAfterEvent,
        items: _splitChecklistItems(localizations.checklistAfterEventItems),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.checklistMenuReferee,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [ActionSearch(), LanguageSelector(), ThemeSelector()],
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(DRSpacing.l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.checklistSubtitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: DRSpacing.l),
                  for (final section in sections)
                    CollapsibleSection(
                      title: section.title,
                      children: [
                        for (final item in section.items) ...[
                          IgnorePointer(
                            child: CheckboxListTile(
                              controlAffinity:
                                  ListTileControlAffinity.leading,
                              value: true,
                              onChanged: (_) {},
                              title: Text(
                                item,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Divider(height: 1),
                        ],
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
