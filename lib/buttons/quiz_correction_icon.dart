import 'package:diving_rules_hybrid/models/penalty_model.dart';
import 'package:diving_rules_hybrid/theme/dr_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizCorrectionIcon extends StatefulWidget {
  Penalty penaltyQuestion;
  Penalty penaltyAnswer;
  double size;

  QuizCorrectionIcon(
      {required this.penaltyQuestion,
      required this.penaltyAnswer,
      required this.size});

  @override
  _QuizCorrectionIconState createState() => _QuizCorrectionIconState();
}

class _QuizCorrectionIconState extends State<QuizCorrectionIcon> {
  @override
  Widget build(BuildContext context) {
    // if the answer is correct
    if (widget.penaltyQuestion.sanctionValue ==
        widget.penaltyAnswer.sanctionValue) {
      // correct penalty sanction
      if ((widget.penaltyQuestion.referee == widget.penaltyAnswer.referee) &&
          (widget.penaltyQuestion.judge == widget.penaltyAnswer.judge)) {
        //correct penalty ownership
        // icon OK
        return Icon(
          CupertinoIcons.checkmark_circle_fill,
          size: widget.size,
          color: Get.isDarkMode
              ? AppColor.drColorPositiveDark
              : AppColor.drColorPositiveLight,
        );
      } else if ((widget.penaltyQuestion.referee ==
              widget.penaltyAnswer.referee) ||
          (widget.penaltyQuestion.judge == widget.penaltyAnswer.judge)) {
        // case only one of two ownership
        // icon partial
        return Icon(
          CupertinoIcons.exclamationmark_circle_fill,
          size: widget.size,
          color: Get.isDarkMode
              ? AppColor.drColorWarningDark
              : AppColor.drColorWarningLight,
        );
      } else {
        // wrong ownership
        // icon wrong
        return Icon(
          CupertinoIcons.xmark_circle_fill,
          size: widget.size,
          color: Get.isDarkMode
              ? AppColor.drColorNegativeDark
              : AppColor.drColorNegativeLight,
        );
      }
    } else {
      // icon wrong
      return Icon(
        CupertinoIcons.xmark_circle_fill,
        size: widget.size,
        color: Get.isDarkMode
            ? AppColor.drColorNegativeDark
            : AppColor.drColorNegativeLight,
      );
    }
  }
}

// Icons:
// - ok: checkmark_circle_fill
// - wrong: xmark_circle_fill
// - partial: exclamationmark_circle_fill
