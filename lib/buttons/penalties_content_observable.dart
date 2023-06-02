import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

import '../models/globals.dart';

class PenaltyContentObsv extends StatefulWidget {
  int buttonType;
  bool isSelected;

  PenaltyContentObsv({required this.buttonType, required this.isSelected});

  @override
  _PenaltyContentObsvState createState() => _PenaltyContentObsvState();
}

class _PenaltyContentObsvState extends State<PenaltyContentObsv> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0: //    0 > ZeroPts
        // TODO CURRENT: THe status only cha  nges for the 0pts and not the others!!!
        return Obx(() => Column(
              children: [
                SizedBox(height: 4),
                Icon(CupertinoIcons.clear_circled,
                    size: 40,
                    color: currentPenaltyStatus.penaltyZeroPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.button0pts,
                  style: TextStyle(
                      color: currentPenaltyStatus.penaltyZeroPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 4),
                if (currentPenaltyStatus.penaltyZeroPts.value) ...{
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
            ));

        break;
      case 1: //    1 > MinusTwoPts
        return Obx(() => Column(
              children: [
                SizedBox(height: 4),
                Icon(CupertinoIcons.lessthan_circle_fill,
                    size: 40,
                    color: currentPenaltyStatus.penaltyMinusTwoPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.buttonMax2pts,
                  style: TextStyle(
                      color: currentPenaltyStatus.penaltyMinusTwoPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 4),
                if (currentPenaltyStatus.penaltyMinusTwoPts.value) ...{
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
            ));
        break;
      case 2: //    2 > MaxTwoPts
        return Obx(() => Column(
              children: [
                SizedBox(height: 4),
                Icon(CupertinoIcons.lessthan_circle,
                    size: 40,
                    color: currentPenaltyStatus.penaltyMaxTwoPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.buttonMax4Halfpts,
                  style: TextStyle(
                      color: currentPenaltyStatus.penaltyMaxTwoPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 4),
                if (currentPenaltyStatus.penaltyMaxTwoPts.value) ...{
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
            ));
        break;
      case 3: //    3 > MaxFourHalfPts
        return Obx(() => Column(
              children: [
                SizedBox(height: 4),
                Icon(CupertinoIcons.gobackward_minus,
                    size: 40,
                    color: currentPenaltyStatus.penaltyMaxFourHalfPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.buttonMinus2pts,
                  style: TextStyle(
                      color: currentPenaltyStatus.penaltyMaxFourHalfPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 4),
                if (currentPenaltyStatus.penaltyMaxFourHalfPts.value) ...{
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
            ));
        break;
      case 4: //    4 > MinusHalfToTwoPts
        return Obx(() => Column(
              children: [
                SizedBox(height: 4),
                Icon(CupertinoIcons.arrow_left_right_circle,
                    size: 40,
                    color: currentPenaltyStatus.penaltyMinusHalfToTwoPts.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.buttonMinusHalfTo2pts,
                  style: TextStyle(
                      color: currentPenaltyStatus.penaltyMinusHalfToTwoPts.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 4),
                if (currentPenaltyStatus.penaltyMinusHalfToTwoPts.value) ...{
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
            ));
        break;
      case 5: //    5 > JudgeOpinion
        return Obx(() => Column(
              children: [
                SizedBox(height: 4),
                Icon(CupertinoIcons.plusminus_circle,
                    size: 40,
                    color: currentPenaltyStatus.penaltyJudgeOpinion.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary),
                SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.buttonJudgeOpinion,
                  style: TextStyle(
                      color: currentPenaltyStatus.penaltyJudgeOpinion.value
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(height: 4),
                if (currentPenaltyStatus.penaltyJudgeOpinion.value) ...{
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
            ));
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
