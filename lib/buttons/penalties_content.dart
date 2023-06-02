import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/diving_rules_localizations.dart';
import 'package:get/get.dart';

class PenaltyContent extends StatefulWidget {
  int buttonType;
  bool isSelected;

  PenaltyContent({required this.buttonType, required this.isSelected});

  @override
  _PenaltyContentState createState() => _PenaltyContentState();
}

class _PenaltyContentState extends State<PenaltyContent> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0:
        return Column(
          children: [
            Icon(CupertinoIcons.clear_circled,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.button0pts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if (widget.isSelected) ...{
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
      case 1:
        return Column(
          children: [
            Icon(CupertinoIcons.lessthan_circle_fill,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonMax2pts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if (widget.isSelected) ...{
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
      case 2:
        return Column(
          children: [
            Icon(CupertinoIcons.lessthan_circle,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonMax4Halfpts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if (widget.isSelected) ...{
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
      case 3:
        return Column(
          children: [
            Icon(CupertinoIcons.gobackward_minus,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonMinus2pts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if (widget.isSelected) ...{
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
      case 4:
        return Column(
          children: [
            Icon(CupertinoIcons.arrow_left_right_circle,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonMinusHalfTo2pts,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if (widget.isSelected) ...{
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
      case 5:
        return Column(
          children: [
            Icon(CupertinoIcons.plusminus_circle,
                size: 40,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary),
            SizedBox(height: 4),
            Text(
              AppLocalizations.of(context)!.buttonJudgeOpinion,
              style: TextStyle(
                  color: widget.isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.tertiary),
            ),
            SizedBox(height: 4),
            if (widget.isSelected) ...{
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
