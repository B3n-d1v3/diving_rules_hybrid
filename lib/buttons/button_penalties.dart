import 'package:diving_rules_hybrid/buttons/penalties_content.dart';
import 'package:flutter/material.dart';

import '../models/quiz_button_status.dart';

class PenaltyButton extends StatefulWidget {
  int buttonType;
  bool isSelected;

  PenaltyButton({Key? key, required this.buttonType, required this.isSelected})
      : super(key: key);

  @override
  _PenaltyButtonState createState() => _PenaltyButtonState();
}

class _PenaltyButtonState extends State<PenaltyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Reset the current button to opposite status
        setState(() {
          buttonPenaltyStatusChange(sanctionID: widget.buttonType);
          debugPrint(
              '>>>>> Penalty Button > sanction ID: ${widget.buttonType}');
          buttonPenaltyDebug();
        });
      },
      child: Container(
        // TODO: add the circling of the penalty on the right answer
        // decoration: BoxDecoration(
        //   border: Border.all(color: widget.isSelected
        //       ? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.background),
        //   borderRadius: const BorderRadius.all(Radius.circular(20)),
        // )

        child: PenaltyContent(
          buttonType: widget.buttonType,
          isSelected: widget.isSelected,
        ),
      ),
    );
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
