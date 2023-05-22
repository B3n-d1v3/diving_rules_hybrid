// for the json
import 'dart:convert';

// init the Sanction Items & Penalty Summary
import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:diving_rules_hybrid/models/penalty_model.dart';
// the sanction data model and json deserialization
import 'package:diving_rules_hybrid/models/sanction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// for the translation
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class TabPenalties extends StatefulWidget {
  const TabPenalties({Key? key}) : super(key: key);

  @override
  _TabPenaltiesState createState() => _TabPenaltiesState();
}

class _TabPenaltiesState extends State<TabPenalties> {
  // Method to fetch content from the json file
  Future<void> getSanctions(BuildContext context) async {
    final sanctionsFile = await rootBundle
        .loadString('assets/data/divingPenaltiesSanctions.json');
    // final sanctionItems = sanctionItemsFromJson(sanctionsFile);
    setState(() {
      sanctionItems = SanctionItems.fromJson(json.decode(sanctionsFile));
      // Debug checks
      // debugPrint(">>> getPenalties > json file in string sanctionsFile:");
      // debugPrint(sanctionsFile);
      // debugPrint(">>> getPenalties > sanctionItems Object:");
      // debugPrint(
      //     "sanctionItems.sanctions.length: ${sanctionItems.sanctions.length}");
      // debugPrint(
      //     "sanctionItems.sanctions[0].description: ${sanctionItems.sanctions[3].description}");
    });
  }

  Future<void> getPenalties(BuildContext context) async {
    final summaryFile =
        await rootBundle.loadString('assets/data/divingPenaltiesSummary.json');
    // final sanctionItems = sanctionItemsFromJson(sanctionsFile);
    setState(() {
      penaltySummary = PenaltySummary.fromJson(json.decode(summaryFile));
      // Debug checks
      debugPrint(">>> getPenalties > json file in string sanctionsFile:");
      // debugPrint(summaryFile);
      debugPrint(">>> getPenalties > sanctionItems Object:");
      debugPrint(
          "sanctionItems.sanctions.length: ${penaltySummary.penalties.length}");
      debugPrint(
          "sanctionItems.sanctions[3].description: ${penaltySummary.penalties[3].description}");
    });
  }

  @override
  void initState() {
    super.initState();
    // Load the sanctions list json
    // TODO: Move this deserealization in the main file
    getSanctions(context);
    getPenalties(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.penaltiesListTitle),

        // Header trailing functions: Light/Dark switch + Language Selection
        trailing: CupertinoButton(
          onPressed: () {
            setState(() {
              themeState.darkTheme = !themeState.darkTheme;
              // themeModeSwitch = !themeModeSwitch;
            });
          },
          padding: EdgeInsets.zero,
          child: Icon(themeState.darkTheme
              ? CupertinoIcons.moon_stars_fill
              : CupertinoIcons.brightness_solid),
        ),
      ),
      // child: Center(
      //   child: Text('List of penalties'),
      // debugPrint("Test text printed in the console");
      child: SafeArea(
        // View the list of items
        child: PenaltyListView(),

        // Temp test of json decoding with penalty sanctions
        // child: PenaltySanctionsView(),

        // link to test page for penalty description
        // child: CupertinoButton(
        //       onPressed: () {
        //         Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PagePenaltyDescription()));
        //       },
        //       child: Text('Test Next Page')
        //   )
      ),
    );
  }
}

class PenaltyListView extends StatelessWidget {
  // const PenaltyListView({Key? key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: penaltySummary.penalties.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          // TODO: Change from ListTile to custom view to see full penalty description in each items
          child: CupertinoListTile(
            //leading:  Icon(iconsMap[penalties[index].icon]),
            leading: Icon(CupertinoIcons.lessthan_circle_fill),
            // TODO: Get the icon from the penalty type
            title: Text(penaltySummary.penalties[index].description),
            trailing: const CupertinoListTileChevron(),
            // TODO: Add action to open penalty description page
          ),
        );
      },
    );
  }
}

// Temp test of json decoding with penalty sanctions < To be deleted when test is finished
// TODO: Delete this test view when obsolete
class PenaltySanctionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPrint(
    //    ">>>>> PenaltySanctionsView > nb items loaded: ${sanctionItems.sanctions.length}");
    // debugPrint(
    //     "sanctionItems.sanctions[0].description: ${sanctionItems.sanctions[3].description}");

    return ListView.builder(
        itemCount: sanctionItems.sanctions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: CupertinoListTile(
              //leading:  Icon(iconsMap[penalties[index].icon]),
              // TODO: use the object variable icon name to set icon
              leading: Icon(CupertinoIcons.lessthan_circle_fill),
              //leading: Icon(_sanctions[index]["icon"]),
              // TODO: Get the icon from the penalty type
              title: Text(sanctionItems.sanctions[index].description),
              subtitle: Text(sanctionItems.sanctions[index].icon),
              trailing: const CupertinoListTileChevron(),
              // TODO: Add action to open penalty description page
            ),
          );
        });
  }
}
