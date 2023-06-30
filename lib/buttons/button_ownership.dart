import 'package:diving_rules_hybrid/buttons/ownership_content.dart';
import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/quiz_button_status.dart';
import '../theme/dr_colors.dart';

class OwnershipButton extends StatefulWidget {
  int buttonType;
  int penaltyIndex;
  int viewMode;

  OwnershipButton(
      {required this.buttonType, this.penaltyIndex = -1, this.viewMode = 0});

  @override
  _OwnershipButtonState createState() => _OwnershipButtonState();
}

class _OwnershipButtonState extends State<OwnershipButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // if in a quiz mode
          if (widget.viewMode == 1) {
            if (widget.buttonType == 0) {
              currentPenaltyStatus.ownershipReferee =
                  RxBool(!currentPenaltyStatus.ownershipReferee.value);
            } else {
              currentPenaltyStatus.ownershipJudge =
                  RxBool(!currentPenaltyStatus.ownershipJudge.value);
            }

            //canUserGoNext();
            // test function in the set sate
            // if the ownership is in a question
            // can the User Go to the Next page
            if (currentPenaltyStatus.userSanctionSelection.value >= 0 &&
                (currentPenaltyStatus.ownershipReferee.value == true ||
                    currentPenaltyStatus.ownershipJudge.value == true)) {
              // currentQuizNextQuestion = true;
              currentPenaltyStatus.nextQuestion = true.obs;
            } else {
              // currentQuizNextQuestion = false;
              currentPenaltyStatus.nextQuestion = false.obs;
            }
          }

          // Debug status
          // debugPrint('>>>>> Ownership Button');
          // debugPrint('>>>>> Ownership Button > in > ownership ID / buttonType: ${widget.buttonType}');
          // debugPrint('>>>>> Ownership Button > in > penaltyIndex: ${widget.penaltyIndex}');
          // debugPrint('>>>>> Ownership Button > in > viewInQuiz: ${widget.viewInQuiz}');
          // debugPrint('>>>>> Ownership Button > in > viewCorrection: ${widget.viewCorrection}');
          // debugPrint('>>>>> Ownership Button > out > currentPenaltyStatus.ownershipReferee: ${currentPenaltyStatus.ownershipReferee}');
          // debugPrint('>>>>> Ownership Button > out > currentPenaltyStatus.ownershipJudge: ${currentPenaltyStatus.ownershipJudge}');
          // debugPrint('>>>>> Ownership Button > out > currentPenaltyStatus.nextQuestion: ${currentPenaltyStatus.nextQuestion}');
          // debugPrint('>>>>> Ownership Button > out > penaltySummary.penalties[widget.penaltyIndex].sanctionValue: ${penaltySummary.penalties[widget.penaltyIndex].sanctionValue}');

          buttonOwnershipDebug();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                width: 3,
                color: widget.viewMode == 2
                    // if the page is in correction mode check the penalty ownership
                    ? ((widget.buttonType == 0 &&
                                penaltySummary.penalties[widget.penaltyIndex]
                                        .referee ==
                                    true) ||
                            (widget.buttonType == 1 &&
                                penaltySummary
                                        .penalties[widget.penaltyIndex].judge ==
                                    true))

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
        child:
            // TODO: CURRENT  -> Identify where to update the obx observer to show the selection change
            // Obx(() =>
            OwnershipContent(
                buttonType: widget.buttonType,
                penaltyIndex: widget.penaltyIndex,
                viewMode: widget.viewMode)
        // )
        ,
      ),
    );
  }
}

//  Button ID Correspondance
//    0 > Referee > icon: person_fill (or profile_circled, person_crop_circle_badge_exclam)
//    1 > Judges > icon: person_3_fill, group_solid
