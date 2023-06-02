import 'package:diving_rules_hybrid/buttons/ownership_content.dart';
import 'package:diving_rules_hybrid/models/globals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/quiz_button_status.dart';

class OwnershipButton extends StatefulWidget {
  int buttonType;
  int penaltyIndex;
  bool viewInQuiz;
  bool viewCorrection;

  OwnershipButton(
      {required this.buttonType,
      this.penaltyIndex = -1,
      this.viewInQuiz = false,
      this.viewCorrection = false});

  @override
  _OwnershipButtonState createState() => _OwnershipButtonState();
}

class _OwnershipButtonState extends State<OwnershipButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // TODO: CURRENT  ---->>>>> testing new ownership buttons to be updated in the penalty details page and in the quiz details page
          if (widget.viewInQuiz) {
            if (widget.buttonType == 0) {
              currentPenaltyStatus.ownershipReferee =
                  RxBool(!currentPenaltyStatus.ownershipReferee.value);
            } else {
              currentPenaltyStatus.ownershipJudge =
                  RxBool(!currentPenaltyStatus.ownershipJudge.value);
            }
          }
          debugPrint(
              '>>>>> Ownership Button > ownership ID: ${widget.buttonType}');
          buttonOwnershipDebug();
        });
      },
      child: Container(
        // TODO: add the circling of the penalty on the right answer (if viewCorrection && is correct answer)
        // decoration: BoxDecoration(
        //   border: Border.all(color: widget.isSelected
        //       ? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.background),
        //   borderRadius: const BorderRadius.all(Radius.circular(20)),
        // )

        child:
            // TODO: CURRENT  -> Identify where to update the obx observer to show the selection change
            // Obx(() =>
            OwnershipContent(
                buttonType: widget.buttonType,
                penaltyIndex: widget.penaltyIndex,
                viewInQuiz: widget.viewInQuiz)
        // )
        ,
      ),
    );
  }
}

//  Button ID Correspondance
//    0 > Referee > icon: person_fill (or profile_circled, person_crop_circle_badge_exclam)
//    1 > Judges > icon: person_3_fill, group_solid
