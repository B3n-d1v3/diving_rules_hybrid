import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../models/globals.dart';

class PenaltyContentObsv extends StatefulWidget {
  int buttonType;

  //bool isSelected;
  int penaltyIndex;
  bool viewInQuiz;

  PenaltyContentObsv(
      {required this.buttonType,
      //required this.isSelected
      required this.penaltyIndex,
      required this.viewInQuiz});

  @override
  _PenaltyContentObsvState createState() => _PenaltyContentObsvState();
}

class _PenaltyContentObsvState extends State<PenaltyContentObsv> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0: //    0 > ZeroPts
        // TODO CURRENT: 2 Bugs:
        //  - The status only changes for the 0pts, 1/2 to 2 pts and judge opinion; but not the others!!!
        //  - The tap on a penalty button does not deactivate the others
        // test to redraw the current full widget on user click
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.clear_circled,
                size: 40,
                color: widget.viewInQuiz
                    ? currentPenaltyStatus.penaltyZeroPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue ==
                            0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.button0pts,
              style: TextStyle(
                  color: widget.viewInQuiz
                      ? currentPenaltyStatus.penaltyZeroPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary
                      : penaltySummary.penalties[widget.penaltyIndex]
                                  .sanctionValue ==
                              0
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if ((widget.viewInQuiz &&
                    currentPenaltyStatus.penaltyZeroPts.value) ||
                (!widget.viewInQuiz &&
                    (penaltySummary
                            .penalties[widget.penaltyIndex].sanctionValue ==
                        0))) ...{
              //if (currentPenaltyStatus.penaltyZeroPts.value) ...{
              Divider(
                height: 3,
                thickness: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            },
            SizedBox(height: 4),
          ],
        );
        break;
      case 1: //    1 > MinusTwoPts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.lessthan_circle_fill,
                size: 40,
                color: widget.viewInQuiz
                    ? currentPenaltyStatus.penaltyMinusTwoPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue ==
                            1
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonMax2pts,
              style: TextStyle(
                  color: widget.viewInQuiz
                      ? currentPenaltyStatus.penaltyMinusTwoPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary
                      : penaltySummary.penalties[widget.penaltyIndex]
                                  .sanctionValue ==
                              1
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if ((widget.viewInQuiz &&
                    currentPenaltyStatus.penaltyMinusTwoPts.value) ||
                (!widget.viewInQuiz &&
                    (penaltySummary
                            .penalties[widget.penaltyIndex].sanctionValue ==
                        1))) ...{
              Divider(
                height: 3,
                thickness: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            },
            SizedBox(height: 4),
          ],
        );
        break;
      case 2: //    2 > MaxTwoPts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.lessthan_circle,
                size: 40,
                color: widget.viewInQuiz
                    ? currentPenaltyStatus.penaltyMaxTwoPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue ==
                            2
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonMax4Halfpts,
              style: TextStyle(
                  color: widget.viewInQuiz
                      ? currentPenaltyStatus.penaltyMaxTwoPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary
                      : penaltySummary.penalties[widget.penaltyIndex]
                                  .sanctionValue ==
                              2
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if ((widget.viewInQuiz &&
                    currentPenaltyStatus.penaltyMaxTwoPts.value) ||
                (!widget.viewInQuiz &&
                    (penaltySummary
                            .penalties[widget.penaltyIndex].sanctionValue ==
                        2))) ...{
              Divider(
                height: 3,
                thickness: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            },
            SizedBox(height: 4),
          ],
        );
        break;
      case 3: //    3 > MaxFourHalfPts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.gobackward_minus,
                size: 40,
                color: widget.viewInQuiz
                    ? currentPenaltyStatus.penaltyMaxFourHalfPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue ==
                            3
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonMinus2pts,
              style: TextStyle(
                  color: widget.viewInQuiz
                      ? currentPenaltyStatus.penaltyMaxFourHalfPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary
                      : penaltySummary.penalties[widget.penaltyIndex]
                                  .sanctionValue ==
                              3
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if ((widget.viewInQuiz &&
                    currentPenaltyStatus.penaltyMaxFourHalfPts.value) ||
                (!widget.viewInQuiz &&
                    (penaltySummary
                            .penalties[widget.penaltyIndex].sanctionValue ==
                        3))) ...{
              Divider(
                height: 3,
                thickness: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            },
            SizedBox(height: 4),
          ],
        );
        break;
      case 4: //    4 > MinusHalfToTwoPts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.arrow_left_right_circle,
                size: 40,
                color: widget.viewInQuiz
                    ? currentPenaltyStatus.penaltyMinusHalfToTwoPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue ==
                            4
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonMinusHalfTo2pts,
              style: TextStyle(
                  color: widget.viewInQuiz
                      ? currentPenaltyStatus.penaltyMinusHalfToTwoPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary
                      : penaltySummary.penalties[widget.penaltyIndex]
                                  .sanctionValue ==
                              4
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if ((widget.viewInQuiz &&
                    currentPenaltyStatus.penaltyMinusHalfToTwoPts.value) ||
                (!widget.viewInQuiz &&
                    (penaltySummary
                            .penalties[widget.penaltyIndex].sanctionValue ==
                        4))) ...{
              Divider(
                height: 3,
                thickness: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            },
            SizedBox(height: 4),
          ],
        );
        break;
      case 5: //    5 > JudgeOpinion
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.plusminus_circle,
                size: 40,
                color: widget.viewInQuiz
                    ? currentPenaltyStatus.penaltyJudgeOpinion.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue ==
                            5
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonJudgeOpinion,
              style: TextStyle(
                  color: widget.viewInQuiz
                      ? currentPenaltyStatus.penaltyJudgeOpinion.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary
                      : penaltySummary.penalties[widget.penaltyIndex]
                                  .sanctionValue ==
                              5
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if ((widget.viewInQuiz &&
                    currentPenaltyStatus.penaltyJudgeOpinion.value) ||
                (!widget.viewInQuiz &&
                    (penaltySummary
                            .penalties[widget.penaltyIndex].sanctionValue ==
                        5))) ...{
              Divider(
                height: 3,
                thickness: 3,
                indent: 15,
                endIndent: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            },
            SizedBox(height: 4),
          ],
        );
        break;
      default:
        return Text(' ');
    }
  }
}

//  Button ID Correspondance > icons
//    0 > ZeroPts > penalty-sanction-0pts:  clear_circled (or nosign)
//    1 > MinusTwoPts > penalty-sanction-max2pts: lessthan_circle_fill
//    2 > MaxTwoPts > penalty-sanction-max4.5pts: lessthan_circle
//    3 > MaxFourHalfPts > penalty-sanction--2pts: gobackward_minus
//    4 > MinusHalfToTwoPts > penalty-sanction--.5-2pts: arrow_left_right_circle
//    5 > JudgeOpinion > penalty-sanction-judge-opinion: plusminus_circle

// Text
// - 0 > Text(AppLocalizations.of(context)!.button0pts),
// - 1 > Text(AppLocalizations.of(context)!.buttonMax2pts),
// - 2 > Text(AppLocalizations.of(context)!.buttonMax4Halfpts),
// - 3 > Text(AppLocalizations.of(context)!.buttonMinus2pts),
// - 4 > Text(AppLocalizations.of(context)!.buttonMinusHalfTo2pts),
// - 5 > Text(AppLocalizations.of(context)!.buttonJudgeOpinion),
