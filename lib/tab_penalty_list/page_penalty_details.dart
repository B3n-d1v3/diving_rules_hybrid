import 'package:diving_rules_hybrid/buttons/button_penalties.dart';
import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:diving_rules_hybrid/provider/dark_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:provider/provider.dart';

import '../models/globals.dart';
import '../models/sanction_model.dart';
import '../tokens/colors.dart';

class PagePenaltyDescription extends StatefulWidget {
  int index;
  // var thisPenaltySanction =
  //     PenaltySanction(false, false, false, false, false, false);
  // late PenaltySanction penaltySanction;
  PagePenaltyDescription({Key? key, required this.index}) : super(key: key);

  @override
  _PagePenaltyDescriptionState createState() => _PagePenaltyDescriptionState();
}

class _PagePenaltyDescriptionState extends State<PagePenaltyDescription> {
  late PenaltySanction penaltySanction;
  @override
  void initState() {
    //Set the PenaltySanction values
    penaltySanction = setPenaltySanction(
        penaltyNb: penaltySummary.penalties[widget.index].sanctionValue);
    super.initState();
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
      // child: container(
      //   // Retrieves the screen size
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,

      child: SafeArea(
        child: Column(
          children: [
            // TODO: Update the next and previous buttons and use icons
            // left / right navigation in the penalty list to avoid going back to the main list
            // use example: https://www.youtube.com/watch?v=Kc-2MtZnfFo
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (widget.index > 0) {
                          widget.index--;
                          penaltySanction = setPenaltySanction(
                              penaltyNb: penaltySummary
                                  .penalties[widget.index].sanctionValue);
                        }
                      });
                    },
                    child: Text("<"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (widget.index < penaltySummary.penalties.length - 1) {
                        widget.index++;
                        penaltySanction = setPenaltySanction(
                            penaltyNb: penaltySummary
                                .penalties[widget.index].sanctionValue);
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

            // Description Content
            // TODO: Update with the localized version of the description
            Text(penaltySummary.penalties[widget.index].description),

            // Rules References
            DisplayRulesReferences(
                rulesReferences: penaltySummary.penalties[widget.index].rules),
            const Divider(
              height: 20,
              thickness: .5,
              indent: 10,
              endIndent: 10,
              color: AppColor.drColorDeselectedLight,
            ),
            Text(AppLocalizations.of(context)!.penaltyPenalty),
            SizedBox(height: 10),

            // GridView to display the Penalty Sanctions
            GridView.count(
              crossAxisCount: 3,
              primary: false,
              padding: const EdgeInsets.all(1),
              childAspectRatio: (1 / .6),
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                PenaltyButton(
                    buttonType: 0, isSelected: penaltySanction.zeroPts),
                PenaltyButton(
                    buttonType: 1, isSelected: penaltySanction.maxTwoPts),
                PenaltyButton(
                    buttonType: 2, isSelected: penaltySanction.maxFourHalfPts),
                PenaltyButton(
                    buttonType: 3, isSelected: penaltySanction.minusTwoPts),
                PenaltyButton(
                    buttonType: 4,
                    isSelected: penaltySanction.minusHalfToTwoPts),
                PenaltyButton(
                    buttonType: 5, isSelected: penaltySanction.judgeOpinion),
              ],
            ),

            const Divider(
              height: 10,
              thickness: .5,
              indent: 10,
              endIndent: 10,
              color: AppColor.drColorDeselectedLight,
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
            // PenaltyButton(buttonType: 0, isSelected: penaltySanction.zeroPts),
            // PenaltyButton(buttonType: 1, isSelected: penaltySanction.maxTwoPts),
            // PenaltyButton(
            //     buttonType: 2, isSelected: penaltySanction.maxFourHalfPts),
            // PenaltyButton(
            //     buttonType: 3, isSelected: penaltySanction.minusTwoPts),
            // PenaltyButton(
            //     buttonType: 4, isSelected: penaltySanction.minusHalfToTwoPts),
            // PenaltyButton(
            //     buttonType: 5, isSelected: penaltySanction.judgeOpinion),
          ],
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
    return (Text(rulesToDisplay, textAlign: TextAlign.end));
  }
}
