// init the Sanction Items & Penalty Summary
import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:diving_rules_hybrid/nav_penalty_list/screen_penalty_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../buttons/penalty_sanction_icon.dart';
import '../l10n/penalty_description_l10n.dart';

class ScreenPenaltyList extends StatefulWidget {
  const ScreenPenaltyList({Key? key}) : super(key: key);

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
      // appBar: AppBar(
      //   title: Text(AppLocalizations.of(context)!.penaltiesListTitle),
      // ),
      body: SafeArea(
        child: PenaltyListView(),
      ),
    );
  }
}

class PenaltyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// List of the penalties
    return ListView.builder(
      itemCount: penaltySummary.penalties.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: PenaltyIcon(
                buttonType: penaltySummary.penalties[index].sanctionValue,
                size: 30,
              ),
              title: PenaltyDescription(penaltyId: index),
              //Text(penaltySummary.penalties[index].description, maxLines: 4,),
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
        );
      },
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
