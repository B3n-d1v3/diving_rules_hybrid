import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

// import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

import '../models/globals.dart';

class PenaltyContentStatic extends StatefulWidget {
  int buttonType;
  int penaltyIndex;
  int viewMode;

  // vieMode 0 = Penalty View
  // vieMode 1 = Quiz Question View
  // vieMode 2 = Quiz Answer Correction View

  PenaltyContentStatic(
      {required this.buttonType,
      required this.penaltyIndex,
      required this.viewMode});

  @override
  _PenaltyContentStaticState createState() => _PenaltyContentStaticState();
}

class _PenaltyContentStaticState extends State<PenaltyContentStatic> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0: //    0 -> 0 pts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.clear_circled,
                size: 40,
                // if viewed in Quiz  (not in penalty view)
                color: widget.viewMode != 0
                    // if current penalty value is true
                    ? currentPenaltyStatus.penaltyZeroPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    // else (so viewed in the penalty view) check if penalty sanction value concerns this sanction
                    : penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue ==
                            0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.button0pts,
              style: TextStyle(
                  color: widget.viewMode != 0
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
            // Show the divider
            // if in quiz view and the user selected this penalty
            // or if not in quiz view and this is the corresponding penalty sanction value
            if ((widget.viewMode != 0 &&
                    currentPenaltyStatus.penaltyZeroPts.value) ||
                (widget.viewMode == 0 &&
                    (penaltySummary
                            .penalties[widget.penaltyIndex].sanctionValue ==
                        0))) ...{
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
      case 1: //    1 -> - 2 pts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.gobackward_minus,
                size: 40,
                color: widget.viewMode != 0
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
              AppLocalizations.of(context)!.buttonMinus2pts,
              style: TextStyle(
                  color: widget.viewMode != 0
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
            if ((widget.viewMode != 0 &&
                    currentPenaltyStatus.penaltyMinusTwoPts.value) ||
                (widget.viewMode == 0 &&
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
      case 2: //    2 -> Max 2 pts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.lessthan_circle_fill,
                size: 40,
                color: widget.viewMode != 0
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
              AppLocalizations.of(context)!.buttonMax2pts,
              style: TextStyle(
                  color: widget.viewMode != 0
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
            if ((widget.viewMode != 0 &&
                    currentPenaltyStatus.penaltyMaxTwoPts.value) ||
                (widget.viewMode == 0 &&
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
      case 3: //    3 -> Max 4.5 pts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.lessthan_circle,
                size: 40,
                color: widget.viewMode != 0
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
              AppLocalizations.of(context)!.buttonMax4Halfpts,
              style: TextStyle(
                  color: widget.viewMode != 0
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
            if ((widget.viewMode != 0 &&
                    currentPenaltyStatus.penaltyMaxFourHalfPts.value) ||
                (widget.viewMode == 0 &&
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
      case 4: //    4 > - 0.5 to 2 pts
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.arrow_left_right_circle,
                size: 40,
                color: widget.viewMode != 0
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
                  color: widget.viewMode != 0
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
            if ((widget.viewMode != 0 &&
                    currentPenaltyStatus.penaltyMinusHalfToTwoPts.value) ||
                (widget.viewMode == 0 &&
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
      case 5: //    5 -> Judge Opinion
        return Column(
          children: [
            SizedBox(height: 4),
            Icon(CupertinoIcons.plusminus_circle,
                size: 40,
                color: widget.viewMode != 0
                    ? currentPenaltyStatus.penaltyJudgeOpinion.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary
                    : penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue ==
                            5
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.of(context)!.buttonJudgeOpinion,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: widget.viewMode != 0
                        ? currentPenaltyStatus.penaltyJudgeOpinion.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary
                        : penaltySummary.penalties[widget.penaltyIndex]
                                    .sanctionValue ==
                                5
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary),
              ),
            ),
            SizedBox(height: 4),
            if ((widget.viewMode != 0 &&
                    currentPenaltyStatus.penaltyJudgeOpinion.value) ||
                (widget.viewMode == 0 &&
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

//  Button ID Correspondence > icons
//    0 > ZeroPts > penalty-sanction-0pts:  clear_circled (or nosign)
//    1 > MinusTwoPts > penalty-sanction-max2pts: lessthan_circle_fill
//    2 > MaxTwoPts > penalty-sanction-max4.5pts: lessthan_circle
//    3 > MaxFourHalfPts > penalty-sanction--2pts: gobackward_minus
//    4 > MinusHalfToTwoPts > penalty-sanction--.5-2pts: arrow_left_right_circle
//    5 > JudgeOpinion > penalty-sanction-judge-opinion: plusminus_circle

// Text
// - 0 > Text(AppLocalizations.of(context)!.button0pts),
// - 1 > Text(AppLocalizations.of(context)!.buttonMinus2pts),
// - 2 > Text(AppLocalizations.of(context)!.buttonMax2pts),
// - 3 > Text(AppLocalizations.of(context)!.buttonMax4Halfpts),
// - 4 > Text(AppLocalizations.of(context)!.buttonMinusHalfTo2pts),
// - 5 > Text(AppLocalizations.of(context)!.buttonJudgeOpinion),
