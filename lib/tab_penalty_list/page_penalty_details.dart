import 'package:diving_rules_hybrid/buttons/button_penalties.dart';
import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:provider/provider.dart';

import '../models/globals.dart';

class PagePenaltyDescription extends StatefulWidget {
  //final List<Penalty> penalties;
  int index;
  PagePenaltyDescription({Key? key, required this.index}) : super(key: key);
  // String penaltyDescription = "penalty"+ penalty.id.toString();


  @override
  _PagePenaltyDescriptionState createState() => _PagePenaltyDescriptionState();
}

class _PagePenaltyDescriptionState extends State<PagePenaltyDescription> {
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
      // child: container(
      //   // Retrieves the screen size
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,

      child: SafeArea(
        child: Column(
          children: [
            // TODO: Update the next and previous  buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (widget.index > 0) {
                        widget.index--;
                      }
                    });
                  },
                  child: Text("<"),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (widget.index < penaltySummary.penalties.length - 1) {
                        widget.index++;
                      }
                    });
                  },
                  child: Text(">"),
                ),
              ],
            ),
            // TODO Update all styles and display positioning
            Text(AppLocalizations.of(context)!.penaltyRule),
            Text(AppLocalizations.of(context)!.penaltyDescription),

            // TODO: Update with the localized version of the description
            Text(penaltySummary.penalties[widget.index].description),

            // Text(AppLocalizations.of(context)!.),

            DisplayRulesReferences(
                rulesReferences: penaltySummary.penalties[widget.index].rules),
            Text(AppLocalizations.of(context)!.penaltyPenalty),
            Row(
              // set all row elements evenly in the available width
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Add the penalties buttons (0pts, max 2 pts...)
                Text(AppLocalizations.of(context)!.button0pts),
                Text(AppLocalizations.of(context)!.buttonMax2pts),
                Text(AppLocalizations.of(context)!.buttonMax4Halfpts),
              ],
            ),
            Row(
              // set all row elements evenly in the available width
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: Add the penalties buttons (0pts, max 2 pts...)
                Text(AppLocalizations.of(context)!.buttonMinus2pts),
                Text(AppLocalizations.of(context)!.buttonMinusHalfTo2pts),
                Text(AppLocalizations.of(context)!.buttonJudgeOpinion),
              ],
            ),
            Text(AppLocalizations.of(context)!.penaltyOwnership),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TODO: Add the Ownership buttons of the penalty(judge/referee)
                Text(AppLocalizations.of(context)!.buttonReferee),
                Text(AppLocalizations.of(context)!.buttonJudge),
              ],
            ),

            // Test the penalty button mechanism
            PenaltyButton(
                buttonType: 0,
                isSelected: if penaltySummary.penalties[widget.index].
            ),
            PenaltyButton(buttonType: 1, isSelected: false),
            PenaltyButton(buttonType: 2, isSelected: true),
            PenaltyButton(buttonType: 3, isSelected: false),
            PenaltyButton(buttonType: 4, isSelected: true),
            PenaltyButton(buttonType: 5, isSelected: false),
          ],
          // TODO: Add left / right navigation in the penalty list to avoid going back to the main list
          // use example: https://www.youtube.com/watch?v=Kc-2MtZnfFo
        ),
        // debugPrint("Test text in console");
        // ),
      ),
    );
  }
}

class DisplayRulesReferences extends StatelessWidget {
  final List<Rule> rulesReferences;
  DisplayRulesReferences({required this.rulesReferences});

  @override
  Widget build(BuildContext context) {
    String rulesToDisplay = "";
    for (var i = 0; i < rulesReferences.length; i++) {
      rulesToDisplay = rulesToDisplay + " - ${rulesReferences[i].ruleId}";
      // Text(" - ${rulesReferences[0].ruleId}")
    }
    return (Text(rulesToDisplay));
  }
}
