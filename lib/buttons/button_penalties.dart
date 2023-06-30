import 'package:diving_rules_hybrid/buttons/penalties_content_observable.dart';
import 'package:diving_rules_hybrid/buttons/penalty_content_static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/globals.dart';
import '../models/quiz_button_status.dart';
import '../theme/dr_colors.dart';

class PenaltyButton extends StatefulWidget {
  int buttonType;
  int penaltyIndex;
  int viewMode;

  // vieMode 0 = Penalty View
  // vieMode 1 = Quiz Question View
  // vieMode 2 = Quiz Answer Correction View

  PenaltyButton(
      {required this.buttonType, this.penaltyIndex = -1, this.viewMode = 0});

  @override
  _PenaltyButtonState createState() => _PenaltyButtonState();
}

class _PenaltyButtonState extends State<PenaltyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Reset the current button to opposite status and cancel others
        setState(() {
          if (widget.viewMode == 1) {
            buttonPenaltyStatusChange(sanctionID: widget.buttonType);
            // Debug
            debugPrint(
                '>>>>> Penalty Button > sanction ID: ${widget.buttonType}');

            // canUserGoNext();
            // test function in the set sate
            // can the User Go to the Next page
            if (currentPenaltyStatus.userSanctionSelection.value >= 0 &&
                (currentPenaltyStatus.ownershipReferee.value == true ||
                    currentPenaltyStatus.ownershipJudge.value == true)) {
              // currentQuizNextQuestion = true;
              currentPenaltyStatus.nextQuestion(true);
            } else {
              // currentQuizNextQuestion = false;
              currentPenaltyStatus.nextQuestion(false);
            }
            debugPrint(
                '>>>>> Penalties Button > currentPenaltyStatus.nextQuestion: ${currentPenaltyStatus.nextQuestion}');
          }

          buttonPenaltyDebug();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                width: 3,
                color: widget.viewMode == 2
                    // if the page is in correction mode
                    ? (widget.buttonType ==
                            penaltySummary
                                .penalties[widget.penaltyIndex].sanctionValue)
                        // this item is the right answer
                        // show border in positive color based on light/dark mode
                        ? Get.isDarkMode
                            ? AppColor.drColorPositiveDark
                            : AppColor.drColorPositiveLight
                        // this item is not the right answer
                        // else hide the border
                        : Theme.of(context).colorScheme.background
                    // if the page is in question mode
                    // else hide the border
                    : Theme.of(context).colorScheme.background)),
        child: (widget.viewMode == 0)
            ? PenaltyContentStatic(
                buttonType: widget.buttonType,
                penaltyIndex: widget.penaltyIndex,
                viewMode: widget.viewMode,
              )
            : PenaltyContentObsv(
                buttonType: widget.buttonType,
                penaltyIndex: widget.penaltyIndex,
                viewMode: widget.viewMode,
              )
        // )
        ,
      ),
    );
  }
}

//  Button type
//  ID > type correspondence: icons_name
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
