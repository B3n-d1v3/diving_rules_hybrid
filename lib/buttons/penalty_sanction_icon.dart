import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PenaltyIcon extends StatefulWidget {
  int buttonType;
  double size;

  PenaltyIcon({required this.buttonType, required this.size});

  @override
  _PenaltyIconState createState() => _PenaltyIconState();
}

class _PenaltyIconState extends State<PenaltyIcon> {
  @override
  Widget build(BuildContext context) {
    switch (widget.buttonType) {
      case 0:
        return Icon(
          CupertinoIcons.clear_circled,
          size: widget.size,
          color: Theme.of(context).colorScheme.primary,
        );
        break;
      case 1:
        return Icon(
          CupertinoIcons.lessthan_circle_fill,
          size: widget.size,
          color: Theme.of(context).colorScheme.primary,
        );
        break;
      case 2:
        return Icon(
          CupertinoIcons.lessthan_circle,
          size: widget.size,
          color: Theme.of(context).colorScheme.primary,
        );
        break;
      case 3:
        return Icon(
          CupertinoIcons.gobackward_minus,
          size: widget.size,
          color: Theme.of(context).colorScheme.primary,
        );
        break;
      case 4:
        return Icon(
          CupertinoIcons.arrow_left_right_circle,
          size: widget.size,
          color: Theme.of(context).colorScheme.primary,
        );
        break;
      case 5:
        return Icon(
          CupertinoIcons.plusminus_circle,
          size: widget.size,
          color: Theme.of(context).colorScheme.primary,
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
