import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

import '../models/globals.dart';
import '../models/token_spacing.dart';

class PenaltyContentObsv extends StatefulWidget {
  int buttonType;
  int penaltyIndex;
  int viewMode;

  // vieMode 0 = Penalty View
  // vieMode 1 = Quiz Question View
  // vieMode 2 = Quiz Answer Correction View

  PenaltyContentObsv(
      {required this.buttonType,
      required this.penaltyIndex,
      required this.viewMode});

  @override
  _PenaltyContentObsvState createState() => _PenaltyContentObsvState();
}

class _PenaltyContentObsvState extends State<PenaltyContentObsv> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0: //    0 -> 0 pts
        return Obx(() => Column(
              children: [
                SizedBox(height: DRSpacing.xs),
                Icon(CupertinoIcons.clear_circled,
                    size: 40,
                    // if viewed in Quiz  (not in penalty view)
                    color: widget.viewMode != 0
                        // if current penalty value is true
                        ? currentPenaltyStatus.penaltyZeroPts.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary
                        // else (so viewed in the penalty view) check if penalty sanction value concerns this sanction
                        : penaltySummary.penalties[widget.penaltyIndex]
                                    .sanctionValue ==
                                0
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: DRSpacing.xs),

                Text(
                  AppLocalizations.of(context)!.button0pts,
                  textAlign: TextAlign.center,
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

                // TODO CURRENT: Make the line blue on selection and background the rest of the time to take out the resizing of the page
                SizedBox(height: DRSpacing.xs),
                // Show the divider
                // if in quiz view and the user selected this penalty
                // or if not in quiz view and this is the corresponding penalty sanction value

                Divider(
                  height: DRSpacing.xs,
                  thickness: 3,
                  indent: DRSpacing.s,
                  endIndent: DRSpacing.s,
                  color: ((widget.viewMode != 0 &&
                              currentPenaltyStatus.penaltyZeroPts.value) ||
                          (widget.viewMode == 0 &&
                              (penaltySummary.penalties[widget.penaltyIndex]
                                      .sanctionValue ==
                                  0)))
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.background,
                ),

                SizedBox(height: DRSpacing.xs),
              ],
            ));
        break;
      case 1: //    1 -> - 2 pts
        return Obx(() => Column(
              children: [
                SizedBox(height: DRSpacing.xs),
                Icon(CupertinoIcons.gobackward_minus,
                    size: 40,
                    color: widget.viewMode != 0
                        ? currentPenaltyStatus.penaltyMinusTwoPts.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary
                        : penaltySummary.penalties[widget.penaltyIndex]
                                    .sanctionValue ==
                                1
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: DRSpacing.xs),
                Text(
                  AppLocalizations.of(context)!.buttonMinus2pts,
                  textAlign: TextAlign.center,
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
                SizedBox(height: DRSpacing.xs),
                Divider(
                  height: DRSpacing.xs,
                  thickness: 3,
                  indent: DRSpacing.s,
                  endIndent: DRSpacing.s,
                  color: ((widget.viewMode != 0 &&
                              currentPenaltyStatus.penaltyMinusTwoPts.value) ||
                          (widget.viewMode == 0 &&
                              (penaltySummary.penalties[widget.penaltyIndex]
                                      .sanctionValue ==
                                  1)))
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.background,
                ),
                SizedBox(height: DRSpacing.xs),
              ],
            ));
        break;
      case 2: //    2 -> Max 2 pts
        return Obx(() => Column(
              children: [
                SizedBox(height: DRSpacing.xs),
                Icon(CupertinoIcons.lessthan_circle_fill,
                    size: 40,
                    color: widget.viewMode != 0
                        ? currentPenaltyStatus.penaltyMaxTwoPts.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary
                        : penaltySummary.penalties[widget.penaltyIndex]
                                    .sanctionValue ==
                                2
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: DRSpacing.xs),
                Text(
                  AppLocalizations.of(context)!.buttonMax2pts,
                  textAlign: TextAlign.center,
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
                SizedBox(height: DRSpacing.xs),
                Divider(
                  height: DRSpacing.xs,
                  thickness: 3,
                  indent: DRSpacing.s,
                  endIndent: DRSpacing.s,
                  color: ((widget.viewMode != 0 &&
                              currentPenaltyStatus.penaltyMaxTwoPts.value) ||
                          (widget.viewMode == 0 &&
                              (penaltySummary.penalties[widget.penaltyIndex]
                                      .sanctionValue ==
                                  2)))
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.background,
                ),
                SizedBox(height: DRSpacing.xs),
              ],
            ));
        break;
      case 3: //    3 -> Max 4.5 pts
        return Obx(() => Column(
              children: [
                SizedBox(height: DRSpacing.xs),
                Icon(CupertinoIcons.lessthan_circle,
                    size: 40,
                    color: widget.viewMode != 0
                        ? currentPenaltyStatus.penaltyMaxFourHalfPts.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary
                        : penaltySummary.penalties[widget.penaltyIndex]
                                    .sanctionValue ==
                                3
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: DRSpacing.xs),
                Text(
                  AppLocalizations.of(context)!.buttonMax4Halfpts,
                  textAlign: TextAlign.center,
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
                SizedBox(height: DRSpacing.xs),
                Divider(
                  height: DRSpacing.xs,
                  thickness: 3,
                  indent: DRSpacing.s,
                  endIndent: DRSpacing.s,
                  color: ((widget.viewMode != 0 &&
                              currentPenaltyStatus
                                  .penaltyMaxFourHalfPts.value) ||
                          (widget.viewMode == 0 &&
                              (penaltySummary.penalties[widget.penaltyIndex]
                                      .sanctionValue ==
                                  3)))
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.background,
                ),
                SizedBox(height: DRSpacing.xs),
              ],
            ));
        break;
      case 4: //    4 > - 0.5 to 2 pts
        return Obx(() => Column(
              children: [
                SizedBox(height: DRSpacing.xs),
                Icon(CupertinoIcons.arrow_left_right_circle,
                    size: 40,
                    color: widget.viewMode != 0
                        ? currentPenaltyStatus.penaltyMinusHalfToTwoPts.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary
                        : penaltySummary.penalties[widget.penaltyIndex]
                                    .sanctionValue ==
                                4
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: DRSpacing.xs),
                Text(
                  AppLocalizations.of(context)!.buttonMinusHalfTo2pts,
                  textAlign: TextAlign.center,
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
                SizedBox(height: DRSpacing.xs),
                Divider(
                  height: DRSpacing.xs,
                  thickness: 3,
                  indent: DRSpacing.s,
                  endIndent: DRSpacing.s,
                  color: ((widget.viewMode != 0 &&
                              currentPenaltyStatus
                                  .penaltyMinusHalfToTwoPts.value) ||
                          (widget.viewMode == 0 &&
                              (penaltySummary.penalties[widget.penaltyIndex]
                                      .sanctionValue ==
                                  4)))
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.background,
                ),
                SizedBox(height: DRSpacing.xs),
              ],
            ));
        break;
      case 5: //    5 -> Judge Opinion
        return Obx(() => Column(
              children: [
                SizedBox(height: DRSpacing.xs),
                Icon(CupertinoIcons.plusminus_circle,
                    size: 40,
                    color: widget.viewMode != 0
                        ? currentPenaltyStatus.penaltyJudgeOpinion.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary
                        : penaltySummary.penalties[widget.penaltyIndex]
                                    .sanctionValue ==
                                5
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: DRSpacing.xs),
                Text(
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
                SizedBox(height: DRSpacing.xs),
                Divider(
                  height: DRSpacing.xs,
                  thickness: 3,
                  indent: DRSpacing.s,
                  endIndent: DRSpacing.s,
                  color: ((widget.viewMode != 0 &&
                              currentPenaltyStatus.penaltyJudgeOpinion.value) ||
                          (widget.viewMode == 0 &&
                              (penaltySummary.penalties[widget.penaltyIndex]
                                      .sanctionValue ==
                                  5)))
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.background,
                ),
                SizedBox(height: DRSpacing.xs),
              ],
            ));
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
