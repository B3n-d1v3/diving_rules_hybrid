// init the Sanction Items & Penalty Summary
import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:diving_rules_hybrid/nav_penalty_list/screen_penalty_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../buttons/penalty_sanction_icon.dart';
import '../l10n/action_language_selector.dart';
import '../l10n/diving_rules_localizations.dart';
import '../l10n/penalty_description_l10n.dart';
import '../models/token_spacing.dart';
import '../sub_views/action_search.dart';
import '../sub_views/collapsible_section.dart';
import '../theme/action_theme_selector.dart';

class ScreenPenaltyList extends StatefulWidget {
  const ScreenPenaltyList({super.key});

  @override
  State<ScreenPenaltyList> createState() => _ScreenPenaltyListState();
}

class _ScreenPenaltyListState extends State<ScreenPenaltyList> {
  @override
  void initState() {
    // debugPrint('>>>> PenaltyList > initState in > currentPage: "${currentPage}"');
    // Setup to check if the user is calling the search from within the rule book page
    currentPage = 'penalties';
    // could be 'start', 'rulebook', 'penalties', 'quiz', 'about'
    // debugPrint('>>>> PenaltyList > initState out > currentPage: "${currentPage}"');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.checklistMenuJudgePenalties,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [ActionSearch(), LanguageSelector(), ThemeSelector()],
      ),
      body: SafeArea(
        child: PenaltyListView(),
      ),
    );
  }
}

class PenaltyListView extends StatelessWidget {
  const PenaltyListView({super.key});

  // Same reading order as the sanction table on the penalty detail page
  // (screen_penalty_details.dart): row 1 is 0/2/3, row 2 is 1/4/5.
  static const List<int> _sanctionOrder = [0, 2, 3, 1, 4, 5];

  String _sanctionLabel(BuildContext context, int sanctionValue) {
    final localizations = AppLocalizations.of(context)!;
    switch (sanctionValue) {
      case 0:
        return localizations.button0pts;
      case 1:
        return localizations.buttonMinus2pts;
      case 2:
        return localizations.buttonMax2pts;
      case 3:
        return localizations.buttonMax4Halfpts;
      case 4:
        return localizations.buttonMinusHalfTo2pts;
      case 5:
        return localizations.buttonJudgeOpinion;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(DRSpacing.l),
      children: [
        Text(
          AppLocalizations.of(context)!.penaltiesSubtitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: DRSpacing.l),
        for (final sanctionValue in _sanctionOrder)
          CollapsibleSection(
            title: _sanctionLabel(context, sanctionValue),
            children: [
              for (var index = 0;
                  index < penaltySummary.penalties.length;
                  index++)
                if (penaltySummary.penalties[index].sanctionValue ==
                    sanctionValue) ...[
                  ListTile(
                    leading: PenaltyIcon(
                      buttonType:
                          penaltySummary.penalties[index].sanctionValue,
                      size: 30,
                    ),
                    title: PenaltyDescription(penaltyId: index),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {
                      Get.to(
                        () => PagePenaltyDescription(index: index),
                        transition: Transition.rightToLeftWithFade,
                        curve: Curves.ease,
                      );
                    },
                  ),
                  Divider(),
                ],
            ],
          ),
      ],
    );
  }
}

// Temp test of json decoding with penalty sanctions < To be deleted when test is finished
// TODO: Delete this test view when obsolete
// class PenaltySanctionsView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // debugPrint(
//     //    ">>>>> PenaltySanctionsView > nb items loaded: ${sanctionItems.sanctions.length}");
//     // debugPrint(
//     //     "sanctionItems.sanctions[0].description: ${sanctionItems.sanctions[3].description}");
//
//     return ListView.builder(
//         itemCount: sanctionItems.sanctions.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//             child: CupertinoListTile(
//               //leading:  Icon(iconsMap[penalties[index].icon]),
//               leading: Icon(CupertinoIcons.lessthan_circle_fill),
//               //leading: Icon(_sanctions[index]["icon"]),
//               title: Text(sanctionItems.sanctions[index].description),
//               subtitle: Text(sanctionItems.sanctions[index].icon),
//               trailing: const CupertinoListTileChevron(),
//             ),
//           );
//         });
//   }
// }
