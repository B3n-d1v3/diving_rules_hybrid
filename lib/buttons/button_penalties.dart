import 'package:diving_rules_hybrid/tokens/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';

class PenaltyButton extends StatefulWidget {
  int buttonType;
  bool isSelected;
  PenaltyButton({required this.buttonType, required this.isSelected});

  @override
  _PenaltyButtonState createState() => _PenaltyButtonState();
}

class _PenaltyButtonState extends State<PenaltyButton> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0:
        return Column(
          children: [
            Icon(CupertinoIcons.nosign,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : AppColor.drColorDeselectedLight),
            SizedBox(height: 5),
            Text(
              AppLocalizations.of(context)!.button0pts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : AppColor.drColorDeselectedLight),
            ),
          ],
        );
        break;
      case 1:
        return Column(
          children: [
            Icon(CupertinoIcons.lessthan_circle_fill,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : AppColor.drColorDeselectedLight),
            SizedBox(height: 5),
            Text(
              AppLocalizations.of(context)!.buttonMax2pts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : AppColor.drColorDeselectedLight),
            ),
          ],
        );
        break;
      case 2:
        return Column(
          children: [
            Icon(CupertinoIcons.lessthan_circle,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : AppColor.drColorDeselectedLight),
            SizedBox(height: 5),
            Text(
              AppLocalizations.of(context)!.buttonMax4Halfpts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : AppColor.drColorDeselectedLight),
            ),
          ],
        );
        break;
      case 3:
        return Column(
          children: [
            Icon(CupertinoIcons.gobackward_minus,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : AppColor.drColorDeselectedLight),
            SizedBox(height: 5),
            Text(
              AppLocalizations.of(context)!.buttonMinus2pts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : AppColor.drColorDeselectedLight),
            ),
          ],
        );
        break;
      case 4:
        return Column(
          children: [
            Icon(CupertinoIcons.arrow_left_right_circle,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : AppColor.drColorDeselectedLight),
            SizedBox(height: 5),
            Text(
              AppLocalizations.of(context)!.buttonMinusHalfTo2pts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : AppColor.drColorDeselectedLight),
            ),
          ],
        );
        break;
      case 5:
        return Column(
          children: [
            Icon(CupertinoIcons.plusminus_circle,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : AppColor.drColorDeselectedLight),
            SizedBox(height: 5),
            Text(
              AppLocalizations.of(context)!.buttonJudgeOpinion,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : AppColor.drColorDeselectedLight),
            ),
          ],
        );
        break;
      default:
        return Text(' ');
    }
  }
}

//  Button ID Correspondance
//    0 > ZeroPts
//    1 > MinusTwoPts
//    2 > MaxTwoPts
//    3 > MaxFourHalfPts
//    4 > MinusHalfToTwoPts
//    5 > JudgeOpinion
//
// Icons:
// - 0 > penalty-sanction-0pts:  nosign
// - 1 > penalty-sanction-max2pts: lessthan_circle_fill
// - 2 > penalty-sanction-max4.5pts: lessthan_circle
// - 3 > penalty-sanction--2pts: gobackward_minus
// - 4 > penalty-sanction--.5-2pts: arrow_left_right_circle
// - 5 > penalty-sanction-judge-opinion: plusminus_circle

// - penalty-owner-referee:    ??? person_fill
// - penalty-owner-judges: group_solid  ( or person_3_fill )

// Text
// - 0 > Text(AppLocalizations.of(context)!.button0pts),
// - 1 > Text(AppLocalizations.of(context)!.buttonMax2pts),
// - 2 > Text(AppLocalizations.of(context)!.buttonMax4Halfpts),
// - 3 > Text(AppLocalizations.of(context)!.buttonMinus2pts),
// - 4 > Text(AppLocalizations.of(context)!.buttonMinusHalfTo2pts),
// - 5 > Text(AppLocalizations.of(context)!.buttonJudgeOpinion),
